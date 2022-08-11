import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:write_jh/data/write.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late final dref = FirebaseDatabase.instance.ref("write");
  late DatabaseReference databaseReference;

  void readData() {
    DatabaseReference _dbRef = FirebaseDatabase.instance.ref("write"); //실시간 데이터베이스에 저장된 write만 가져오기 위해
    _dbRef.once().then((DatabaseEvent databaseEvent) {
      print("데이터 읽어오기" + databaseEvent.snapshot.value.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    databaseReference = dref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('그리다, 글'),
        centerTitle: true,
      ),
      body:
        FirebaseAnimatedList(
          shrinkWrap: true,
          query: databaseReference,
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation animation, int index) {
            //return Text(snapshot.value.["content"]);
            return listTest(snapshot);
          }
        )
    );
  }

  listTest(snapshot) {
    var value = Map<String, dynamic>.from(snapshot.value as Map);
    var title = value["content"];
    //Text(snapshot.value.["content"]); 이렇게 쓰려고 했더니 오류가 나서 위에 방식으로 바꿔봤다.
    //스냅샷의 값은 여러 유형이 될 수 있으며 여기에 유형을 표시해야 할 것 같다라는 말에 의해..
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0
          )
        ),
      ),
      child: Text(title)
    );
  }
}