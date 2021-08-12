import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JournalList extends StatefulWidget {
  @override
  _JournalListState createState() => _JournalListState();
}

class _JournalListState extends State<JournalList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoNavigationBar(
        middle: Text('JournalList'),
      ),
    );
  }
}
