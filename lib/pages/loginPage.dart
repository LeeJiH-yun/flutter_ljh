import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:write_jh/data/user.dart';

import 'package:write_jh/pages/signUpPage.dart';
import 'package:write_jh/pages/home.dart';

class loginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<loginPage> with TickerProviderStateMixin {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseURL = 'https://writejh-56604-default-rtdb.firebaseio.com/';

  double opacity = 0;
  AnimationController? _animationController;
  Animation? _animation;
  TextEditingController? _idTextController;
  TextEditingController? _pwTextController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _idTextController = new TextEditingController();
    _pwTextController = new TextEditingController();

    _animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = Tween(begin: 0, end: pi * 2).animate(_animationController!);
    _animationController!.repeat();

    Timer(Duration(seconds: 2), () {
      setState(() {
        opacity = 1;
      });
    });

    _database = FirebaseDatabase(databaseURL: _databaseURL);
    reference = _database!.reference().child('user');
  }

  void makeDialog(String text) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(text),
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("그리다, 글"),
        centerTitle: true,
        elevation: 0, //그림자 없애주기
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              AnimatedBuilder(
                animation: _animationController!,
                builder: (context, widget) {
                  return Transform.rotate(
                    angle: _animation!.value,
                    child: widget
                  );
                }
              ),
              Container(//앱 메인 이미지
                child: Image.asset('asset/images/logo.png', width: 100, height: 100, fit: BoxFit.fill),
              ),
              SizedBox(height: 45.0), //사이 공백
              TextFormField( //값을 입력받을 수 있는 폼
                controller: _idTextController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "아이디는 필수입니다.";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "아이디",
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 13.0), //사이 공백
              TextFormField(
                controller: _pwTextController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true, //비밀번호 별표 처리하기
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "비밀번호는 필수입니다.";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "비밀번호",
                  border: OutlineInputBorder()
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    //   Navigator.pop(context)
                    // }
                    if (_idTextController!.value.text.length == 0 || _pwTextController!.value.text.length == 0) {
                      makeDialog("빈칸이 있습니다.");
                    }
                    else {
                      reference!.child(_idTextController!.value.text).onValue.listen((event) {
                        if (event.snapshot.value == null) {
                          makeDialog("아이디가 없습니다.");
                        }
                        else {
                          print("여기..고");
                          reference!.child(_idTextController!.value.text).onChildAdded.listen((event) {
                            User user = User.fromSnapshot(event.snapshot);
                            var bytes = utf8.encode(_pwTextController!.value.text);
                            var digest = sha1.convert(bytes);
                            print("여기부터 오륜가?" + digest.toString());
                            if (user.pw == digest.toString()) {
                              //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                              Navigator.pop(context);
                              print("여기타나");
                            }
                            else {
                              makeDialog("비밀번호가 틀립니다.");
                              print("여긴 아니고");
                            }
                          });
                        }
                      });
                    }
                  },
                  child: const Text("로그인")
                )
              ),
              SizedBox(height: 5.0), //사이 공백
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 11.0), //사이 공백
              IntrinsicHeight(
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("비밀번호찾기"),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.orange,
                    ),
                    Container(
                      child: Text("아이디찾기"),
                    ),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.orange,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage()));
                      },
                      child: Container(
                        child: Text("회원가입"),
                      ),
                    )
                  ],
                )
              )
            ]
          ),
        )
      )
    );
  }
}