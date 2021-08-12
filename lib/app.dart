import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanchaek/pages/mainPage.dart';

import 'constants/customColor.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // 앱을 vertically 고정
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
    return CupertinoApp(
      title: '마음산.책',
      theme: CupertinoThemeData(
        primaryColor: CustomColors.iconNavy,
        brightness: Brightness.light,
      ),
      home: MainPage(),
    );
  }
}
