import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';



var ref = FirebaseFirestore.instance.collection("users");


Future<void> updateUser(uid, fname, contact, lname, email, password, ) {
  return ref
      .doc(uid)
      .update({
    'name': '${fname} ${lname}',
    'fname': fname,
    'lname': lname,
    'email': email,
    'password': password,
    'contact': contact,
  })
      .then((value) {
    Fluttertoast.showToast(msg: 'User updated');
  })
      .catchError((error) {
        Fluttertoast.showToast(msg: 'Error while updating');
  });
}