import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';
import 'package:sanchaek/models/bookModel.dart';
import 'package:sanchaek/models/requestSavedModel.dart';
import 'package:sanchaek/store/wishListStore.dart';
import '../models/wishListModel.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textController;

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
                        child: book.isSaved == null
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

  _saveBook(BookModel book) {
    final result = WishListStore.instance.wishBooks
        .where((e) => e.url.contains(book.url))
        .isEmpty;

    if (result) {
      final id = WishListStore.instance.wishBooks.length;
      WishListStore.instance.wishBooks.add(WishListModel(
        wishBookId: id,
        title: book.title,
        content: book.contents,
        url: book.url,
        dateTime: book.dateTime,
        authors: book.authors,
        publisher: book.publisher,
        translators: book.translators,
        thumbnail: book.thumbnail,
        isbn: book.isbn,
        isRead: false,
        isSaved: true,
      ));
    }

    print(result);

    setState(() {});
  }
}
