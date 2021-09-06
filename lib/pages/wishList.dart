import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';
import 'package:flutter/material.dart';
import 'package:sanchaek/models/bookModel.dart';
import 'package:sanchaek/store/wishListStore.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListStore wishStore = WishListStore.instance;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await wishStore.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '마음살.책',
          style: TextStyle(fontSize: 15),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            _buildList(),
          ],
        ),
      ),
    );
  }

// 마음살.책 목록 생성
  _buildList() => Expanded(
        child: wishStore.loading != false
            ? Center(
                child: Text('로딩중'),
              )
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
                padding: EdgeInsets.all(3),
                children: List.generate(
                  wishStore.wishBooks.length,
                  (index) => _buildItem(wishStore.wishBooks[index]),
                ),
              ),
      );

// 마음살.책 아이템 생성
  _buildItem(BookModel book) => Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.white,
                  child: Image(
                    image: NetworkImage(book.thumbnail),
                  ),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.edit),
                    Icon(Icons.favorite),
                  ],
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                book.title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
}
