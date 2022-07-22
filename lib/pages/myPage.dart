import 'package:flutter/material.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar (
          title: Text("그리다, 글"),
          centerTitle: true,
          elevation: 0, //그림자 없애주기
        ),
        body: Container(
          child: Text('Third')
        )
    );
  }
}