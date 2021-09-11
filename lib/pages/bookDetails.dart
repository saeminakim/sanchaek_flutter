import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/models/bookModel.dart';

class BookDetails extends StatefulWidget {
  final BookModel book;

  BookDetails({this.book});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  // @override
  // void initState() {
  //   super.initState();
  //   print(widget.book);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('책 소개'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              _bookImage(),
              _bookInfo(),
            ],
          ),
        ),
      ),
    );
  }

  _bookImage() => Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: NetworkImage(widget.book.thumbnail),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.1),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Image.network(widget.book.thumbnail),
                      height: 200,
                    ),
                    InkWell(
                      onTap: () {
                        widget.book.isRead
                            ? print("독서노트 남기기")
                            : print("마음산.책에 추가");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, right: 5),
                            child: Icon(
                              widget.book.isRead
                                  ? Icons.edit_outlined
                                  : Icons.add_circle_outline,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              widget.book.isRead ? '독서노트 남기기' : '마음산.책에 추가',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  _bookInfo() => Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 5, top: 5),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.book.title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 3),
              child: Row(
                children: [
                  Text(
                    widget.book.authors + '저',
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColors.iconGrey,
                    ),
                  ),
                  Text(
                    widget.book.translators != null
                        ? ' / ' + widget.book.translators + '역 | '
                        : ' | ',
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColors.iconGrey,
                    ),
                  ),
                  Text(
                    widget.book.publisher + ' | ',
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColors.iconGrey,
                    ),
                  ),
                  Text(
                    widget.book.price + '원',
                    style: TextStyle(
                      fontSize: 10,
                      color: CustomColors.iconGrey,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                widget.book.contents,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      );
}
