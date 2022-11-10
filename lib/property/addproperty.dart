import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../constants/methods.dart';
import '../constants/success_screen.dart';
import 'property_list.dart';

Future addProperty(
    String title, desc, bedroom, washroom, parking, kitchen,
    tap, ac, quarters, type, houseNo, occupationName,
    occupationContact, streetName, gpsAddress, int price, int floorArea
    ) async{

  final ref = FirebaseDatabase.instance.ref();
  final key = ref.child("Property").push().key;


  try{
    ref.child("Property").child(key!).set({
      'uid': auth.currentUser?.uid,
      'title': title,
      'desc': desc,
      'bedrooms': '$bedroom Bedrooms',
      'washrooms': '$washroom Washrooms',
      'parking': '$parking Parking',
      'kitchens': '$kitchen Kitchens',
      'floorArea': '$floorArea Floor Area',
      'tap': tap == true ? 'Tap Available' : 'Tap Unavailable',
      'ac': ac == true ? 'AC Available' : 'AC Unavailable',
      'quarters': quarters == true ? 'Quarters Available' : 'Quarters Unavailable',
      'price': price,
      'type': type,
      'houseNo': houseNo,
      'streetName': streetName,
      'gpsAddress': gpsAddress,
      'occupationName': occupationName,
      'occupationContact': occupationContact,
      'visitCharger': '80',
      'pId': key
    });

    Get.to(()=>SuccessScreen(
      text: 'Your Property Ad posted successfully',
      buttonText: 'Go To My Listings',
      onTap: (){
        Get.to(()=> PropertyList());
      },
    ));
    Fluttertoast.showToast(msg: 'Property Listed successful');

  }catch(e){
    Fluttertoast.showToast(msg: e.toString());
    print(e.toString());
  }
}

Future updateProperty(
    String title, desc, bedrooms, washrooms, parking, kitchens, floorArea, price, tap, ac, quarters, type
    //int price, double areaUnit
    ) async{

  final ref = FirebaseDatabase.instance.ref();
  final key = ref.child("Property").push().key;

  try{
    ref.child("Property").push().update({
      'uid': auth.currentUser?.uid,
      'title': title == null? '' : title,
      'desc': desc,
      'bedrooms': bedrooms == null? '0 Bedrooms' : '$bedrooms Bedrooms',
      'washrooms': washrooms == null? '0 Washrooms' : '$washrooms Washrooms',
      'parking': parking == null? '0 parking' : '$parking Parking',
      'kitchens': kitchens == null? '0 kitchens' : '$kitchens Kitchens',
      'floorArea': '$floorArea Floor Area',
      'tap': tap == true ? 'Tap Available' : 'Tap Unavailable',
      'ac': ac == true ? 'AC Available' : 'AC Unavailable',
      'quarters': quarters == true ? 'Quarters Available' : 'Quarters Unavailable',
      'price': price,
      'type': type
    });

    Fluttertoast.showToast(msg: 'Property update successful');

  }catch(e){
    Fluttertoast.showToast(msg: e.toString());
  }
}

Future addServiceProvider(
    String email, fname, String lname, String location, String service, String status
    //int price, double areaUnit
    ) async{

  final ref = FirebaseDatabase.instance.ref();
  final key = ref.child("ServiceProvider").push().key;

  try{
    ref.child("ServiceProvider").push().set({
      'email': email,
      'fname': fname,
      'lname': lname,
      'location': location,
      'service': service,
      'status':status
    });
    Fluttertoast.showToast(msg: 'Service Provider added');
  }catch(e){
    Fluttertoast.showToast(msg: e.toString());
  }
}

adDetails(String key) async{
  final ref = FirebaseDatabase.instance.ref().child('Property');
  DataSnapshot ad = await ref.child(key).once() as DataSnapshot;

  var property = Map<String, dynamic>.from(ad.value as Map);
}

Future addQNA(String type, desc) async{

  final ref = FirebaseDatabase.instance.ref();

  try{
    ref.child("questions").push().set({
      'type': type,
      'desc': desc,
    });

    Fluttertoast.showToast(msg: 'Submitted');

    Get.back();

  }catch(e){
    Fluttertoast.showToast(msg: e.toString());
  }
}

Future reportProvider(String reason, String desc, String email) async{

  final ref = FirebaseDatabase.instance.ref();

  try{
    ref.child("reports").push().set({
      'reason': reason,
      'desc': desc,
      'email': auth.currentUser?.email,
      'provider\'s email': email
    });

    Fluttertoast.showToast(msg: 'Report submitted');

  }catch(e){
    Fluttertoast.showToast(msg: e.toString());
  }
}