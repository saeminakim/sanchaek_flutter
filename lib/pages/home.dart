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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$name님의 서재',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: () {
                _menus();
              },
              icon: Icon(Icons.settings),
              color: CustomColors.iconGrey,
              iconSize: 20,
            ),
          ),
        ],
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _topBar(),
          _topImage(),
          Container(height: 10),
          _quote(),
          _goal(),
          _achievement(),
        ],
      ),
    );
  }

  _menus() => showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('이미지 편집'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('글귀 편집'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.check_circle_outline),
                title: Text('독서 목표 설정'),
                onTap: () {},
              ),
            ],
          );
        },
      );

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
