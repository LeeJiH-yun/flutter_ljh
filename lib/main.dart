import 'package:flutter/material.dart';
import 'package:write_jh/pages/home.dart';
import 'package:write_jh/pages/calendar.dart';
import 'package:write_jh/pages/myPage.dart';

void main() { //플러터 앱 실행의 시작
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
  List<Map> mapArray = [
    {"title": "'넌 사랑받기 충분한 사람이야'\n어느 날 말을 이을 수 없어 눈물만 흘리던 내게 지우가 그렇게 말했다.\n'앞으로는 내가 널 더 많이 사랑할게. 이제 사랑받는 기분이 뭔지도 느끼며 살아'\n아무 이유없이 나를 싫어하는 사람이 있듯이, 어떤 이유없이 나를 사랑해주는 사람도 있다는 것을 나는 지우를 보며 알았다",
     "writeUser": "_최은영 소설 <밝은 밤>"},
    {"title": "그 길은 정말 이상한 곳이오.\n8월의 어느 날, 길을 따라가다가 고개를 들어보니 당신이 잔디밭을 지나 내 트럭으로 다가오고 있었소. 되돌아보면 피할 수 없는 일이었던 듯 싶소.\n달리는 될 수가 없었던 것 같소.",
      "writeUser": "_로버트 제임스 뮐러 소설 <매디슨 카운티의 다리>"},
    {"title": "나는 이 이름을 오랫동안 낮은 목소리로 어둠 속에서 되풀이해 불러 본다. 그러자 내 마음속에서 무엇인가 의미를 알 수 없는 감정이 북받쳐 오르고, 나는 두 눈을 감은 채 조용히 그것을 맞이한다.\n슬픔이여 안녕!",
      "writeUser": "_프랑수아즈 사강 소설 <슬픔이여 안녕>"},
    {"title": "테스트 문구1",
      "writeUser": "_테스트 소설 <테스트>"},
    {"title": "테스트 문구2",
      "writeUser": "_테스트2 소설 <테스트>"},
    {"title": "테스트 문구3",
      "writeUser": "_테스트3 소설 <테스트>"},
    {"title": "테스트 문구4",
      "writeUser": "_테스트4 소설 <테스트>"},
    {"title": "테스트 문구5",
      "writeUser": "_테스트5 소설 <테스트>"},
  ];
  int //idx = 0,
      _selectedIndex = 0;
  static List<Widget> pages = [Home(),Calendar(),myPage()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //extends의 규칙: override를 반드시 해줘야한다.
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text("그리다, 글"),
        centerTitle: true,
        elevation: 0, //그림자 없애주기
      ), //플러터 내부 위젯
      // body: Container ( //Container는 div개념과 같다.
      body: pages[_selectedIndex], //화면 이동처리
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
      ),
    );
  }
}
