import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/methods.dart';

String chatroomId(String user1, String user2){

  if(user1[0].toLowerCase().codeUnits[0] > user2[0].toLowerCase().codeUnits[0]){

    return '$user1$user2';
  }
  return '$user2$user1';
}

Future sendMessage(String message,String uid, String roomId, String time) async{


  final ref = FirebaseDatabase.instance.ref();
  final key = ref.child('chatroom').push().key;
  final snapshot = await ref.child('chatroom/$roomId').get();


  // if(snapshot.exists){
  //   try{
  //     ref.child('chatroom').child('${auth.currentUser?.uid}_${uid}').push().set({
  //       'message': message,
  //       'receiverId': uid,
  //       'senderId': auth.currentUser?.uid,
  //       'roomId': '${auth.currentUser?.uid}_${uid}',
  //       'time': time
  //     });
  //
  //   }catch(e){
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  //
  // }

    try{
      ref.child('chatroom').child('${auth.currentUser?.uid}_${uid}').push().set({
        'message': message,
        'receiverId': uid,
        'senderId': auth.currentUser?.uid,
        'roomId': '${auth.currentUser?.uid}_${uid}',
        'time': time
      });

    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }

}

Map? searchedUser;
Future searchUser(String search) async{

  QuerySnapshot UserSnap = await firestore.collection('users').where('email', isEqualTo: search).get();
  searchedUser = UserSnap.docs[0].data() as Map?;

  print('Name: '+searchedUser!['name']);
  print('Status: '+searchedUser!['status']);

}


void onSendMessage(String message) async{

  Map <String, dynamic> messages = {
    'sendBy': auth.currentUser?.uid,
    'message': message,
    'time': FieldValue.serverTimestamp()
  };
  try {
    firestore.collection('chatroom').add(messages);
  } on Exception catch (e) {
    Fluttertoast.showToast(msg: e.toString());
  }


}