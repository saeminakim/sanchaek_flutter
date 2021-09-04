import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanchaek/components/bottomMenus.dart';
import 'package:sanchaek/pages/home.dart';
import 'package:sanchaek/pages/journalList.dart';
import 'package:sanchaek/pages/search.dart';
import 'package:sanchaek/pages/wishList.dart';

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
    return MaterialApp(
      title: '마음산.책',
      theme: ThemeData(
        primaryColor: CustomColors.iconNavy,
        accentColor: Colors.grey[200],
        brightness: Brightness.light,
        scaffoldBackgroundColor: CupertinoColors.systemGrey6,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Home(),
              JournalList(),
              WishList(),
              Search(),
            ],
          ),
          bottomNavigationBar: BottomMenus(),
        ),
      ),
    );
  }
}
