import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';
import 'package:sanchaek/models/bookModel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text = '';
  }

  List<BookModel> _books = [];
  List<BookModel> _savedBooks = [];

  double devicePixelRatio;
  double displayHeight;
  double displayWidth;

  bool alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey6,
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
          ),
        ),
        middle: Text(
          '검색',
          style: TextStyle(
            color: CustomColors.iconNavy,
            fontSize: 15,
          ),
        ),
      ),
      child: _books.isEmpty
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
        margin: EdgeInsets.only(left: 6, right: 6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CupertinoTextField(
                    controller: _textController,
                    decoration: null,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    _books = await Client.create().books(_textController.text);
                    setState(() {});
                  },
                  child: Icon(
                    CupertinoIcons.search,
                    color: CustomColors.iconGrey,
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
    alreadySaved = _savedBooks.contains(book.isbn);

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
                Container(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      print("위시리스트 가기");
                      setState(() {
                        if (alreadySaved) {
                          _savedBooks.remove(book);
                          alreadySaved = false;
                        } else {
                          _savedBooks.add(book);
                          alreadySaved = true;
                        }
                      });
                    },
                    child: Icon(
                      alreadySaved
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: alreadySaved
                          ? CupertinoColors.systemRed
                          : CustomColors.iconGrey,
                      size: 10,
                    ),
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

  _saveBook(BookModel book) {
    //TODO 책을 받아서 DB에 저장하는 API 호출
  }
}
