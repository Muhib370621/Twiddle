import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../constants/methods.dart';
import '../../../property/property_ads/user_property_ad.dart';
import '../../../property/property_details.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

bool outline = true;
bool outline2 = true;

class _FavouritesState extends State<Favourites> {

  final ref = FirebaseDatabase.instance.ref('Property');
  Stream<QuerySnapshot> snap = firestore.collection('users').snapshots();

  var fav;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BackButtonText(text: 'Favourites', size: 18, fontWeight: FontWeight.bold),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: transparent,
      ),
      backgroundColor: white,
      body: Column(
        children: [

          // Expanded(
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream: snap,
          //     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          //       if (snapshot.hasError){
          //         return Center(child: PoppinsText(text: "Something went wrong"));
          //       }
          //       else if (snapshot.connectionState == ConnectionState.waiting){
          //         return Center(child: CircularProgressIndicator());
          //       }
          //       final data = snapshot.requireData;
          //       // var doc = snapshot.data?.docs[index].data();
          //       return ListView.builder(
          //           itemCount: data.size,
          //           itemBuilder: (context, index){
          //
          //             ///var favourite = data.docs[index]['favourite'];
          //
          //             return PoppinsText(
          //               text: '${index+1} -> ${data.docs[index]['name']}',
          //             );
          //           }
          //       );
          //     },
          //   ),
          // ),
          Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (BuildContext context, DataSnapshot snapshot,
                    Animation<double> animaiton, int index){


                  var value = Map<String, dynamic>.from(snapshot.value as Map);
                  //var key = snapshot.key;

                  var pId = value['pId'];

                  if (pId == pId){
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.to(()=> PropertyDetails(
                              title: value['title'],
                              bedroom: value['bedrooms'],
                              location: value['desc'],
                              type: value['type'],
                              price: value['price'],
                              ac: value['ac'],
                              desc: value['desc'],
                              kitchen: value['kitchens'],
                              parking: value['parking'],
                              quarters: value['quarters'],
                              tap: value['tap'],
                              washroom: value['washrooms'],
                              uid: value['uid'],
                              visitCharges: value['visitCharges'],
                            ));
                          },
                          child: UserPropertyAD(
                            icon: Icons.bookmark,
                            index: index,
                            type: value['type'],
                            bedrooms: value['bedrooms'],
                            title: value['title'],
                            price: value['price'],
                            location: value['desc'],
                            addFavTap: (){
                              removeFav();
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();

                }
              )
          ),

          Height(size: 20)

        ]
      )
    );
  }

  void removeFav() async{
    await firestore.collection('users').doc(auth.currentUser?.uid).collection('favourites').doc().update({
      'favourite': ''
    });
  }

}
