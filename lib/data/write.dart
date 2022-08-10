import 'package:firebase_database/firebase_database.dart';

class Write {
  String writeUser;
  String content;
  String saveDate;

  Write(this.writeUser, this.content, this.saveDate);

  Write.fromSnapshot(DataSnapshot snapshot)
      : writeUser = (snapshot.value! as Map<String, dynamic>)['writeUser'],
        content = (snapshot.value! as Map<String, dynamic>)['content'],
        saveDate = (snapshot.value! as Map<String, dynamic>)['saveDate'];

  toJson() {
    return {
      'writeUser' : writeUser,
      'content' : content,
      'saveDate' : saveDate
    };
  }
}