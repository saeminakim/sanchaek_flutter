import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';
import 'package:sanchaek/models/bookModel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textController;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  List<BookModel> _books = [];

  double devicePixelRatio;
  double displayHeight;
  double displayWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '검색',
          style: TextStyle(fontSize: 15),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: _books.isEmpty
          ? Column(
              children: [
                _searchBar(),
                Text('책검색ㄱㄱ'),
              ],
            )
          : Column(
              children: [
                _searchBar(),
                _bookList(),
              ],
            ),
    );
  }

  _searchBar() => Container(
        margin: EdgeInsets.all(6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    focusNode: focusNode,
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: CustomColors.iconGrey,
                        iconSize: 20,
                        onPressed: () async {
                          _books =
                              await Client.create().books(_textController.text);
                          setState(() {});
                        },
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: CustomColors.iconGrey,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    _textController.clear();
                                  },
                                );
                              },
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _bookList() {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    displayHeight = MediaQuery.of(context).size.height * devicePixelRatio;
    displayWidth = MediaQuery.of(context).size.width * devicePixelRatio;

    return Container(
      height: displayHeight * 0.25,
      padding: EdgeInsets.all(10),
      child: ListView(
        children: List.generate(
          _books.length,
          (index) => _book(_books[index]),
        ),
      ),
    );
  }

  _book(BookModel book) {
    return Stack(
      children: [
        Positioned(
          left: displayWidth * 0.06,
          top: displayHeight * 0.01,
          child: _bookCard(book),
        ),
        _bookThumbnail(book),
      ],
    );
  }

  _bookCard(BookModel book) {
    return Container(
      width: displayWidth * 0.24,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: displayHeight * 0.037,
            width: displayWidth * 0.01,
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _saveBook(book);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: !book.isSaved
                            ? Icon(
                                CupertinoIcons.heart,
                                color: CustomColors.iconGrey,
                                size: 10,
                              )
                            : Icon(
                                CupertinoIcons.heart_fill,
                                color: CupertinoColors.systemRed,
                                size: 10,
                              ),
                      ),
                      Container(
                        width: 3,
                      ),
                      Container(
                        child: Icon(
                          CupertinoIcons.book,
                          color: CustomColors.iconGrey,
                          size: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    book.title,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    book.authors,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    '',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _bookThumbnail(BookModel book) {
    final thumbnail = book.thumbnail;
    final thumbnailIsEmpty = thumbnail.isEmpty;
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey4.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 3),
          ),
        ],
      ),
      height: displayHeight * 0.055,
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.all(8),
      child: thumbnailIsEmpty
          ? Image.asset('assets/noimage.png')
          : Image(
              image: NetworkImage(thumbnail),
            ),
    );
  }

  _saveBook(BookModel book) async {
    try {
      await Client.create().addWishList(book);

      showToast('마음살.책에 저장되었습니다.');

      setState(() {});
    } catch (ex) {
      showToast('책을 저장할 수 없습니다.');
    }
  }

  showToast(String msg) async {
    await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Theme.of(context).accentColor.withOpacity(0.6),
      textColor: Colors.black,
      fontSize: 13,
    );
  }
}
