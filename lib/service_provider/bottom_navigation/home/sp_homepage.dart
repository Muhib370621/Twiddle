import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/hive/hive.dart';

import '../../../bottom_navigation/drawer/notification/Notifications.dart';
import '../../../new/report_service_provider.dart';
import '../../verification.dart';


class SPHomePage extends StatefulWidget {
  const SPHomePage({Key? key}) : super(key: key);

  @override
  State<SPHomePage> createState() => _SPHomePageState();
}

class _SPHomePageState extends State<SPHomePage> {

  @override
  Widget build(BuildContext context) {

    final auth = FirebaseAuth.instance;

    Stream<QuerySnapshot> info = FirebaseFirestore.instance.collection("users").snapshots();
    var verified;

    return Scaffold(
      backgroundColor: white,
      body: Container(
        height: Get.height, width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Height(size: 40),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                PoppinsText(text: 'Manage Orders', size: 20, fontWeight: FontWeight.bold,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=> Notifications());
                  },
                  child: Icon(Icons.notifications, size: 30.sp)
                )
              ],
            ),

            Height(size: 20),

            GestureDetector(
                onTap: (){
                  Get.to(()=> SPVerification());
                },
                child: MyContainer(
                  color: active, height: 60, radius: 50,
                  horizontalPadding: 20,
                  child: Row(
                    children: [

                      Icon(Icons.person, color: white),
                      Width(size: 10,),
                      Expanded(
                          child: PoppinsText(text: 'Verify your identity with Twiddle', color: Colors.white,)
                      ),
                      Icon(Icons.arrow_circle_right_outlined, color: white),

                  ],
                ),
              )
            ),

            Height(size: 20),

            Row(
              children: [

                Button(
                  text: 'Active', width: 100, height: 40, radius: 5,
                ),
                Width(size: 15,),

                Button(
                  text: 'Completed', width: 120, height: 40, radius: 5,
                  buttonColor: shadowcolor, color: black,
                )

              ],
            ),

            Height(size: 15),
            PoppinsText(text: 'Active Jobs', size: 20, fontWeight: FontWeight.bold),

            Height(size: 15),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: info,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError){
                    return Center(child: PoppinsText(text: "Something went wrong"));
                  }
                  else if (snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  final data = snapshot.requireData;
                  // var doc = snapshot.data?.docs[index].data();
                  return ListView.builder(
                      itemCount: data.size,
                      itemBuilder: (context, index){

                        // var doc = snapshot.data?.docs[index].data();
                        var uid = data.docs[index]['uid'];

                        if(auth.currentUser?.uid == uid){

                          return SP(
                            name: 'name'.toString(),
                            desc: data.docs[index]['desc'],
                            price: data.docs[index]['price'],
                            verified: data.docs[index]['verified'],
                            fromtime: data.docs[index]['fromtime'],
                            totime: data.docs[index]['totime'],
                            imageUrl: 'img'.toString(),
                            location: data.docs[index]['location'],
                          );

                          // return SP(
                          //   name: data.docs[index]['name'],
                          //   desc: data.docs[index]['desc'],
                          //   price: data.docs[index]['price'],
                          //   verified: data.docs[index]['verified'],
                          //   fromtime: data.docs[index]['fromtime'],
                          //   totime: data.docs[index]['totime'],
                          //   imageUrl: data.docs[index]['profilePic'],
                          //   location: data.docs[index]['location'],
                          // );
                        }

                        return Container();
                      }
                  );
                },
              ),
            ),


            Height(),



          ],
        ),
      ),
    );
  }
}

class SP extends StatelessWidget {
  String? verified; String name; String? imageUrl; String desc;
  String? price; String? fromtime; String? totime;
  String? location;
  SP({Key? key,
    this.verified, this.name = '', this.imageUrl, this.desc = 'This is description',
    this.price, this.fromtime, this.totime, this.location
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 20, verticalPadding: 20, radius: 20,
      shadowColor: maincolor.withOpacity(0.1), color: white,
      child: Stack(
        children: [

          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Row(
                children: [

                  verified == 'true'?
                  Stack(
                    children: [
                      Container(
                        height: Get.height/13, width: Get.height/13,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: imageUrl != null? DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(imageUrl!)
                            ) : DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/adm.png')
                            )
                        ),
                      ),
                      Positioned(
                        right: 1, top: 1, height: Get.height/50, width: Get.height/50,
                        child: Image.asset('assets/verified.png'),
                      )

                    ],
                  ) : Container(
                    height: Get.height/13, width: Get.height/13,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: imageUrl != null? DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(imageUrl!)
                      ) : DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/adm.png')
                      )
                    ),
                  ),

                  Width(size: 10,),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      PoppinsText(text: name, size: 14, fontWeight: FontWeight.w500),

                      Row(
                        children: [

                          Icon(Icons.date_range, color: maincolor, size: 15.sp),
                          Width(),
                          PoppinsText(text: 'date', size: 10),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.access_time_filled, color: maincolor, size: 15.sp),
                          Width(),
                          PoppinsText(text: 'time: $fromtime - $totime', size: 10),
                        ],)

                    ],
                  ),

                ],
              ),

              Height(size: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(text: 'Total Hours', fontWeight: FontWeight.w500),
                  PoppinsText(text: 'Total Amount', color: hinttext, fontWeight: FontWeight.w500)
                ],
              ),
              Height(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(text: '02 Hours', fontWeight: FontWeight.w500),
                  PoppinsText(text: '124 GH₵', color: hinttext, fontWeight: FontWeight.w500)
                ],
              ),
              Height(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(text: 'Location', fontWeight: FontWeight.w500),
                  Row(
                    children: [
                      Icon(Icons.my_location, size: 15.sp, color: maincolor),
                      Width(),
                      PoppinsText(text: location!, fontWeight: FontWeight.w500),
                    ],
                  )
                ],
              ),
              Height(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PoppinsText(text: 'Paid', color: maincolor, fontWeight: FontWeight.w500),
                  PoppinsText(text: 'Ghc $price/Hr', color: maincolor, fontWeight: FontWeight.w500)
                ],
              ),

              Height(size: 15,),
              MyDivider(color: lightButton),
              Height(),

              PoppinsText(text: 'Order Note', fontWeight: FontWeight.w500),
              PoppinsText(text: desc, color: hinttext, size: 10),

              Height(),

              Iconbutton(
                text: 'Contact', buttonColor: purple, icon: Icons.messenger,
                width: 130, height: 40, shadowColor: purple.withOpacity(0.35),
              )

            ],
          ),

          Positioned(
            right: 10.w, top: 10.h,
            child: GestureDetector(
              onTap: (){
                showDialog(
                    context: (context),
                    builder: (context)=>
                        Dialog(
                          alignment: Alignment.centerRight,
                          child: MyContainer(
                            radius: 15,
                            width: 20, shadowColor: transparent,
                            horizontalPadding: 15.w, verticalPadding: 10.h,
                            child: GestureDetector(
                                onTap: (){
                                  Get.to(()=>ReportServiceProvider(

                                  ));
                                },
                                child: PoppinsText(text: 'Report', size: 10)
                            ),
                          ),
                        )
                );
              },
              child: MyContainer(
                height: 40, width: 40, color: shadowcolor, radius: 20,
                child: Icon(Icons.more_vert),
              ),
            ),
          )

        ],
      ),
    );
  }
}


