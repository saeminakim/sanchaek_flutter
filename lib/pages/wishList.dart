import 'package:flutter/material.dart';
import 'package:sanchaek/models/bookModel.dart';
import 'package:sanchaek/store/wishListStore.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListStore wishListStore = WishListStore.instance;

  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    await wishListStore.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is WishList'),
    );
  }
}
