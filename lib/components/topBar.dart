import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/constants/customColor.dart';

class TopBar extends StatefulWidget {
  TopBar();

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CustomColors.bgNavy,
      middle: Text(
        '마음산.책',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
