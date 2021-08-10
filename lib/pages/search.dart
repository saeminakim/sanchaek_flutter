import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'initial text');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is search'),
    );

    // CupertinoSearchTextField(
    //   controller: _textController,
    // );
  }
}
