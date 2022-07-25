import 'package:flutter/material.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  bool _isChecked = false;

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
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 60.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('asset/images/user.png'),
                  backgroundColor: Colors.white,
                  radius: 50.0,
                )
              ),
              // Container(
              //   width: 100,
              //   height: 100,
              //   decoration: BoxDecoration( //블로그 작성하기 동그라미 만들어서 그 안에 사진 넣는거..
              //     color: Colors.red,
              //     shape: BoxShape.circle
              //   ),
              //   child: Image.asset('asset/images/user.png', width: 100, height: 100, fit: BoxFit.fill),
              // ),
              SizedBox(height: 15.0),
              Container(
                width: 100,
                child: Text("향고래", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              ),
              SizedBox(height: 35.0), //사이 공백
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                padding: EdgeInsets.only(left: 10),
                color: Colors.grey,
                child: Text("알림설정", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.left),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Text("푸시알림", style: TextStyle(fontSize: 18.0)),
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!; //value값이 오류나서 임시방편으로 수정
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      origin: const Offset(2800, 0),
                    )
                  ],
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                padding: EdgeInsets.only(left: 10),
                color: Colors.grey,
                child: Text("앱 정보", style: TextStyle(fontSize: 20.0), textAlign: TextAlign.left),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Text("앱 공유하기", style: TextStyle(fontSize: 18.0), textAlign: TextAlign.left),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("버전체크", style: TextStyle(fontSize: 18.0)),
                    ),
                    Container(
                      child: Text("1.0.0", style: TextStyle(fontSize: 18.0)),
                    ),
                  ],
                )
              ),
              Divider(
                  thickness: 1,
                  color: Colors.grey
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                child: Text("회원탈퇴", style: TextStyle(fontSize: 18.0), textAlign: TextAlign.left),
              ),
              Divider(
                  thickness: 1,
                  color: Colors.grey
              ),
            ]
          )
        )
    );
  }
}
