import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../property/property_ads/user_property_ad.dart';
import '../../property/property_details.dart';


class RentProperty extends StatelessWidget {
  const RentProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseDatabase.instance.ref('Property');

    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animaiton, int index){


        var value = Map<String, dynamic>.from(snapshot.value as Map);

        var type = value['type'];

        if (type == 'Rent'){
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
                  index: index,
                  type: value['type'],
                  bedrooms: value['bedrooms'],
                  title: value['title'],
                  price: value['price'],
                  location: value['desc'],
                ),
              ),
              Height(size: 20),
            ],
          );
        }
        return Container();


      },

    );
  }
}

class SalesProperty extends StatelessWidget {
  const SalesProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseDatabase.instance.ref('Property');

    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animaiton, int index){


        var value = Map<String, dynamic>.from(snapshot.value as Map);

        var type = value['type'];

        if (type == 'Sale'){
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
                  index: index,
                  type: value['type'],
                  bedrooms: value['bedrooms'],
                  title: value['title'],
                  price: value['price'],
                  location: value['desc'],
                ),
              ),
              Height(size: 20),
            ],
          );
        }
        return Container();


      },

    );
  }
}

class ShortStayProperty extends StatelessWidget {
  const ShortStayProperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseDatabase.instance.ref('Property');

    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animaiton, int index){


        var value = Map<String, dynamic>.from(snapshot.value as Map);

        var type = value['type'];

        if (type == 'Short Stay'){
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
                  index: index,
                  type: value['type'],
                  bedrooms: value['bedrooms'],
                  title: value['title'],
                  price: value['price'],
                  location: value['desc'],
                ),
              ),
              Height(size: 20),
            ],
          );
        }
        return Container();


      },

    );
  }
}
