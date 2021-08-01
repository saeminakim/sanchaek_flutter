import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/components/bottomMenus.dart';
import 'package:sanchaek/constants/customColor.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CustomColors.bgNavy,
        middle: Text(
          '마음산.책',
          style: TextStyle(
            color: CustomColors.bgPink,
          ),
        ),
      ),
      child: BottomMenus(),
    );
  }
}
