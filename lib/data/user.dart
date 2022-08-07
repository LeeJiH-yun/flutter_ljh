import 'package:firebase_database/firebase_database.dart';

class User {
  String id;
  String pw;
  String createTime;

  User(this.id, this.pw, this.createTime);

  User.fromSnapshot(DataSnapshot snapshot)
    : id = (snapshot.value! as Map<String, dynamic>)['id'],
      pw = (snapshot.value! as Map<String, dynamic>)['pw'],
      createTime = (snapshot.value! as Map<String, dynamic>)['createTime'];

  toJson() {
    return {
      'id' : id,
      'pw' : pw,
      'createTime' : createTime
    };
  }
}