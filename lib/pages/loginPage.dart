import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();
  String _inputId = '', _inputPw = '';

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
              Container(//앱 메인 이미지
                child: Image.asset('asset/images/logo.png', width: 100, height: 100, fit: BoxFit.fill),
              ),
              SizedBox(height: 45.0), //사이 공백
              TextFormField( //값을 입력받을 수 있는 폼
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  setState(() {
                    _inputId = value as String;
                  });
                },
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
                keyboardType: TextInputType.visiblePassword,
                obscureText: true, //비밀번호 별표 처리하기
                onSaved: (value) {
                  setState(() {
                    _inputPw = value as String;
                  });
                },
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
                  onPressed: () => {
                    //if (_formKey.currentState!.validate()) {
                    Navigator.pop(context)
                    //}
                  },
                  child: const Text("로그인")
                ),
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
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage()));
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