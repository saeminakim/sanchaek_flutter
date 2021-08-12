import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/models/bookModel.dart';

class BookSummary extends StatelessWidget {
  final BookModel book;

  BookSummary(
    this.book,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("상세페이지 ㄱㄱ");
        // Navigator.of(context).push();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: [
            _bookCard(),
            _bookThumbnail(),
          ],
        ),
      ),
    );
  }

  _bookCard() => Container(
        child: _bookCardContent(),
        height: 124.0,
        margin: EdgeInsets.only(left: 46.0),
        decoration: BoxDecoration(
          color: CustomColors.bgGrey,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
      );

  _bookCardContent() => Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 4),
            Text(book.title),
            Container(height: 4),
            Text(book.authors),
            Container(height: 4),
            Text(book.publisher),
          ],
        ),
      );

  _bookThumbnail() => Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Image(
          image: NetworkImage(book.thumbnail),
          height: 92,
        ),
      );
}
