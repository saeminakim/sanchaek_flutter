import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/customColor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String name = '김서재';
  final String quote =
      '사람들은 의사가 환자를 치료하는 것이라고 생각하지만 꼭 그런 것만은 아니다. 생각해보면 환자가 의사를 먹여 살리는 셈이고, 때로는 환자가 의사를 치료하기도 한다. ';

  double devicePixelRatio;
  int displayWidth;
  int displayHeight;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
          ),
        ),
        middle: Text(
          '$name님의 서재',
          style: TextStyle(
            color: CustomColors.iconNavy,
            fontSize: 15,
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.only(bottom: 2),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () {
                      print('액션1');
                      Navigator.of(context).pop();
                    },
                    child: Text('이미지 편집'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      print('액션2');
                      Navigator.of(context).pop();
                    },
                    child: Text('글귀 편집'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      print('액션3');
                      Navigator.of(context).pop();
                    },
                    child: Text('독서 목표 설정'),
                  )
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: () {
                    print('취소');
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
              ),
            );
          },
          child: Icon(
            Icons.settings,
            color: CustomColors.iconGrey,
            size: 20,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _topImage(),
          Container(height: 10),
          _quote(),
          _goal(),
          _achievement(),
        ],
      ),
    );
  }

  Widget _topImage() {
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    displayWidth =
        (MediaQuery.of(context).size.width * devicePixelRatio * 0.8).toInt();
    displayHeight =
        (MediaQuery.of(context).size.height * devicePixelRatio * 0.3).toInt();

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: Image(
        image:
            NetworkImage('https://picsum.photos/$displayWidth/$displayHeight'),
      ),
    );
  }

  Widget _quote() => Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          quote,
          style: TextStyle(
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget _goal() => Container(
        child: Text(
          '85%',
          style: TextStyle(fontSize: 20),
        ),
      );

  Widget _achievement() => Container(
        child: Text('00권 남았어요!'),
      );
}
