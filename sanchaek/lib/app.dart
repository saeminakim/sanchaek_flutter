import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/bottomMenus.dart';
import 'constants/customColor.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: '마음산.책',
      theme: CupertinoThemeData(
        primaryColor: CustomColors.bgNavy,
      ),
      home: BottomMenus(),
    );
  }
}
