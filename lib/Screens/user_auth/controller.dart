import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class StatusControlle extends GetxController{


  getStatus() async {

    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('UserStatus').get();
    if (snapshot.exists) {
      print(snapshot.value);
    } else {
      print('No data available.');
    }
  }
}