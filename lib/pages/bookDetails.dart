import 'package:flutter/material.dart';
import 'package:sanchaek/models/bookModel.dart';

class BookDetails extends StatefulWidget {
  final BookModel book;

  BookDetails({this.book});

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  // TODO 여기 컨테이너 렌더링 안됨 왜지????
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.book.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      '책 정보 들어갈 곳',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Positioned(
                    child: AppBar(
                      title: Text('책 소개'),
                      elevation: 0,
                      centerTitle: true,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
