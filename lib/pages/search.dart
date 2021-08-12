import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';
import 'package:sanchaek/models/bookModel.dart';
import 'package:sanchaek/pages/bookSummary.dart';

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
  double devicePixelRatio;
  double displayHeight;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
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

  _searchBar() => DecoratedBox(
        decoration: BoxDecoration(
          color: CustomColors.bgGrey,
          borderRadius: BorderRadius.circular(10),
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
      );

  _bookList() {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    displayHeight = MediaQuery.of(context).size.height * devicePixelRatio;

    return Container(
      child: ListView(
        children: List.generate(
          _books.length,
          (index) => _book(_books[index]),
        ),
      ),
    );
    // return Container(
    //   height: displayHeight * 0.8,
    //   child: GridView.count(
    //     crossAxisCount: 2,
    //     children: List.generate(
    //       _books.length,
    //       (index) => _book(_books[index]),
    //     ),
    //   ),
    // );
  }

  _book(BookModel book) {
    final thumbnail = book.thumbnail;
    return CupertinoButton(
      onPressed: () {},
      child: Container(
        child: Row(
          children: [
            Container(
              child: Image(
                image: NetworkImage(thumbnail),
                height: 100,
                // height: displayHeight * 0.1,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      book.authors,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
