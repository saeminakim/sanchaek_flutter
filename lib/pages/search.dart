import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sanchaek/constants/customColor.dart';
import 'package:sanchaek/http/client.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          '검색',
          style: TextStyle(
            color: CustomColors.iconNavy,
            fontSize: 15,
          ),
        ),
        backgroundColor: CustomColors.bgGrey,
      ),
      child: IntrinsicHeight(
        child: Column(
          children: [
            _searchBar(),
          ],
        ),
      ),
    );

    // CupertinoSearchTextField(
    //   controller: _textController,
    // );
  }

  _searchBar() => Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: CupertinoTextField(
          controller: _textController,
          suffix: Container(
            padding: EdgeInsets.only(right: 8),
            child: CupertinoButton(
              child: Icon(CupertinoIcons.search),
              color: CustomColors.iconGrey,
              onPressed: () async {
                await Client.create().books(_textController.text);
              },
            ),
          ),
          decoration: BoxDecoration(
            color: CustomColors.bgGrey,
            // border: Border.all(
            //   color: CustomColors.iconGrey,
            //   width: 0.5,
            // ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
}
