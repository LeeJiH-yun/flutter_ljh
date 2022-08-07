import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:write_jh/pages/home.dart';
import 'package:write_jh/pages/calendar.dart';
import 'package:write_jh/pages/myPage.dart';

void main() async { //플러터 앱 실행의 시작
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('ko-KR', null);//기본 언어 초기화
  runApp(MyApp()); //MyApp은 클래스 이름으로 바꿔줄 수 있다.
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //앱을 가장 상단에서 감싸고 있는 곳 MaterialApp
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      }, //핸드폰 설정크기 영향 받지않고 글자 폰트 유지하기
      debugShowCheckedModeBanner: false, //우측 상단의 디버그 표시를 없앤다.
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainHome(),
      //home에 들어갈 내용은 페이지이다. 제일 먼저 나오는 페이지.
      //페이지는 Scaffold 라는 형태를 가진다.
      //home은 페이지를 받아야하고 페이지는 Scaffold 형태가 되어야한다.
    );
  }
}
//class MainHome 으로만 선언하면 클래스만 생성한 것이기 때문에
//위젯으로 바꿔줘야한다. StatelessWidget을 상속받음으로써...
//위젯에는 2가지 종류가 있다. StatelessWidget / StatefulWidget
class MainHome extends StatefulWidget {
  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> {
  int _selectedIndex = 0;
  static List<Widget> pages = [Home(),Calendar(),myPage()]; //탭 선택시 이동할 화면 class

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //extends의 규칙: override를 반드시 해줘야한다.
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: pages[_selectedIndex], //화면 이동처리
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(Icons.border_color_rounded),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_rounded),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      )
    );
  }
}
