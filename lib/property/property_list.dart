import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/bottom_navigation.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/methods.dart';
import 'package:state_agent/property/property_details.dart';

import 'property_ads/property_ad.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({Key? key}) : super(key: key);

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  @override
  Widget build(BuildContext context) {

    final ref = FirebaseDatabase.instance.ref().child("Property");

    var uid;


    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width, height: Get.height,

          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Height(size: 40),

              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: BackButtonText(
                  onTap: (){
                    Get.to(()=> BottomNav());
                  },
                  text: 'My Listed Properties'.toUpperCase(),
                  fontWeight: FontWeight.w500,
                  size: 16,
                  buttonColor: maincolor,
                ),
              ),

              Height(size: 30),

              Expanded(
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animaiton, int index){

                    var value = Map<String, dynamic>.from(snapshot.value as Map);

                    uid = value['uid'];

                    if(uid == auth.currentUser?.uid){
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
                            child: PropertyAD(
                                index: index,
                                type: value['type'],
                                bedrooms: value['bedrooms'],
                                title: value['title'],
                                price: value['price'],
                                location: value['desc']
                            ),
                          ),
                          Height(size: 20),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

class Icontext extends StatelessWidget {
  String? icon, text;
  double? size;
  int? maxLines;
  Color? color;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  TextOverflow? overflow;
  Icontext({
    Key? key,
    this.overflow,
    this.textAlign,
    this.fontWeight,
    this.size,
    this.text,
    this.icon,
    this.maxLines,
    this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/$icon.png'),
        PoppinsText(
            text: text!,
          fontWeight: fontWeight!,
          size: size!,
          color: color!,
          maxLines: maxLines!,
          overflow: overflow!,
          textAlign: textAlign,
        )
      ],
    );
  }
}
