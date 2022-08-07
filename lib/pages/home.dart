import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("그리다, 글"),
        centerTitle: true,
        elevation: 0, //그림자 없애주기
        actions: <Widget>[ //앱바에서 아이콘을 왼쪽에 넣을 때는 actions위젯 오른쪽에 넣을 때는 leading사용
          IconButton( //홈 화면에서만 저장 버튼을 보여준다.
            icon: Icon(Icons.save_alt_rounded),
            onPressed: () {
              print('menu button is clicked');
            },
          ),
        ]
      ),
      body: SingleChildScrollView( //overflow 오류가 나서 추가함
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            InkWell(
                onTap: () {
                  setState(() { //setState() 함수 안에서의 호출은 State 에서 무언가 변경된 사항이 있음을 Flutter Framework 에 알려주는 역할이다.
                    mapArray.shuffle();
                  });
                },
                child: Column(
                  children: <Widget> [
                    Container(
                      color: Colors.white30,
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.arrow_left_rounded, size: 50),
                          Icon(Icons.arrow_right_rounded, size: 50),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Container( //책 내용
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 400,
              padding: EdgeInsets.all(20),
              child: Text(mapArray[idx]["title"],
                  style: TextStyle(fontSize: 20.0)),
            ),
            Container( //책 제목과 저자
              width: MediaQuery.of(context).size.width,
              height: 30,
              color: Colors.white,
              child: Text(mapArray[idx]["writeUser"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  textAlign: TextAlign.right),
            ),
          ],
        )
      ),
    );
  }
}