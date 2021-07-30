import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanchaek/pages/home.dart';
import 'package:sanchaek/pages/journalList.dart';
import 'package:sanchaek/pages/search.dart';
import 'package:sanchaek/pages/wishList.dart';

import 'customColor.dart';

class BottomMenus extends StatefulWidget {
  @override
  _BottomMenusState createState() => _BottomMenusState();
}

class _BottomMenusState extends State<BottomMenus> {
  int _selectedIndex = 0;

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CustomColors.bgNavy,
        activeColor: CustomColors.bgPink,
        inactiveColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onTap(_selectedIndex),
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: '마음산.책',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: '마음살.책',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return Home();
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return JournalList();
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return WishList();
              },
            );
          case 3:
            return CupertinoTabView(
              builder: (context) {
                return Search();
              },
            );
        }
      },
      // body: _menus[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: CustomColors.bgPink,
      //   selectedItemColor: CustomColors.bgNavy,
      //   unselectedItemColor: Colors.grey,
      //   currentIndex: _selectedIndex,
      //   onTap: _onTap,
      //   items: [

      //   ],
    );
  }
}
