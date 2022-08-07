import 'package:flutter/material.dart';

class textList extends StatefulWidget {
  @override
  _textListState createState() => _textListState();
}

class _textListState extends State<textList> {
  List<Map> mapArray = [
    {"id": 0, "title": "'넌 사랑받기 충분한 사람이야'\n어느 날 말을 이을 수 없어 눈물만 흘리던 내게 지우가 그렇게 말했다.\n'앞으로는 내가 널 더 많이 사랑할게. 이제 사랑받는 기분이 뭔지도 느끼며 살아'\n아무 이유없이 나를 싫어하는 사람이 있듯이, 어떤 이유없이 나를 사랑해주는 사람도 있다는 것을 나는 지우를 보며 알았다.",
    "writeUser": "_최은영 소설 <밝은 밤>"},
    {"id": 1, "title": "그 길은 정말 이상한 곳이오.\n8월의 어느 날, 길을 따라가다가 고개를 들어보니 당신이 잔디밭을 지나 내 트럭으로 다가오고 있었소. 되돌아보면 피할 수 없는 일이었던 듯 싶소.\n달리는 될 수가 없었던 것 같소.",
      "writeUser": "_로버트 제임스 뮐러 소설 <매디슨 카운티의 다리>"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그리다, 글'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mapArray.length,
        itemBuilder: (_, index) {
          final item = mapArray[index];
          return Card(
            // this key is required to save and restore ExpansionTile expanded state
            key: PageStorageKey(item['id']),
            color: Colors.amber.shade200,
            elevation: 4,
            child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: true,
              title: Text(item['writeUser']),
              children: [
                Text(item['title']),
              ]
            )
          );
        },
      )
    );
  }
}