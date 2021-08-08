import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sanchaek/pages/home.dart';
import 'package:sanchaek/pages/journalList.dart';
import 'package:sanchaek/pages/search.dart';
import 'package:sanchaek/pages/wishList.dart';

import '../constants/customColor.dart';

class BottomMenus extends StatefulWidget {
  @override
  _BottomMenusState createState() => _BottomMenusState();
}

class _BottomMenusState extends State<BottomMenus> {
  int _selectedIndex = 0;

  CupertinoTabView returnValue;

  _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CustomColors.bgGrey,
        activeColor: CustomColors.iconNavy,
        inactiveColor: CustomColors.iconGrey,
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
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Home(),
                );
              },
            );
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: JournalList(),
                );
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: WishList(),
                );
              },
            );
            break;
          case 3:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Search(),
                );
              },
            );
            break;
        }
        return returnValue;
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
