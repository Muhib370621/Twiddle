import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../Screens/bottom_navi/service_screen/service_details.dart';
import '../../constants/appAssets.dart';
import '../../constants/appColors.dart';
import '../../constants/constants.dart';

class AllServiceProviders extends StatelessWidget {
  final profession;
  AllServiceProviders({Key? key, this.profession}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                // height: 20.h,
                // width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: AppColors.kWhite,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainBg.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(
                          0, 0.5), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: ConstrainedBox(
                            constraints: BoxConstraints.expand(
                                height: 23.h, width: 30.w),
                            child: PopupMenuButton(
                              itemBuilder: (BuildContext context) {
                                return [
                                  const PopupMenuItem(
                                    child: Text("Report"),
                                  ),
                                  const PopupMenuItem(
                                    child: Text("Block"),
                                  ),
                                ];
                              },
                            ),
                          )),
                      Row(
                        children: [
                          Stack(
                            children: [
                              Image.asset("assets/Image1.png",height: 55.h,),
                              Positioned(
                                top: 1.h,
                                left: 41.w,
                                child: SvgPicture.asset(
                                  AppAssets.greenCheckIcon,
                                  height: 10.h,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Martha Hill",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "PoppinsMedium",
                                    color: AppColors.welcomeTwiddle),
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cleaner",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "PoppinsMedium",
                                      color: AppColors.kLightOrange,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 129.w,
                                  ),
                                  Text(
                                    "Ghc 62/hr",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 0.1.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18.sp,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18.sp,
                                  ),
                                  SizedBox(
                                    width: 14.w,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.3.h),
                                    child: Text(
                                      "13 reviews",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.kLightGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(AppAssets.locationIcon,height: 18.h,),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                "Location",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppAssets.greenCheckIcon,
                                height: 18.h,
                                // width: 2.w,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Text(
                                "Available",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          SvgPicture.asset(
                            AppAssets.favUnselectedIcon,
                            // height: 2.h,
                            // width: 2.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h,),
            ],
          );
        });
    // Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();

    // return StreamBuilder<QuerySnapshot>(
    //   stream: ref,
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
    //     if (snapshot.hasError){
    //       return Center(child: PoppinsText(text: "Something went wrong"));
    //     }
    //     else if (snapshot.connectionState == ConnectionState.waiting){
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     final data = snapshot.requireData;
    //     // var doc = snapshot.data?.docs[index].data();
    //     return ListView.builder(
    //         itemCount: data.size,
    //         itemBuilder: (context, index){
    //
    //           if(data.docs[index]['accType'] == 'Service Provider') {
    //
    //             return Column(
    //               children: [
    //
    //                 GestureDetector(
    //                   onTap: (){
    //                     // Get.to(()=> ServiceDetails(
    //                     //   uid: data.docs[index]['uid'],
    //                     ));
    //                   },
    //                   child: ServiceProviders(
    //                     name: data.docs[index]['name'],
    //                     profilePic: data.docs[index]['profilePic'],
    //                     profession: data.docs[index]['profession'],
    //                     price: data.docs[index]['price'],
    //                     location: data.docs[index]['location'],
    //                     verified: data.docs[index]['verified'],
    //                     available: data.docs[index]['available'],
    //                   ),
    //                 ),
    //                 Height()
    //               ],
    //             );
    //           }
    //           return Container();
    //         }
    //     );
    //   },
    // );
  }
}
class HiredServiceProviders extends StatelessWidget {
  const HiredServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              // height: 20.h,
              // width: 100.w,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: AppColors.kWhite,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainBg.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset:
                    const Offset(0, 0.5), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: ConstrainedBox(
                          constraints:
                          BoxConstraints.expand(height: 23.h, width: 30.w),
                          child: PopupMenuButton(
                            itemBuilder: (BuildContext context) {
                              return [
                                const PopupMenuItem(
                                  child: Text("Report"),
                                ),
                                const PopupMenuItem(
                                  child: Text("Block"),
                                ),
                              ];
                            },
                          ),
                        )),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset("assets/Image1.png",height: 55.h,),
                            Positioned(
                              top: 1.h,
                              left: 41.w,
                              child: SvgPicture.asset(
                                AppAssets.greenCheckIcon,
                                height: 10.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Martha Hill",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "PoppinsMedium",
                                  color: AppColors.welcomeTwiddle),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cleaner",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "PoppinsMedium",
                                    color: AppColors.kLightOrange,
                                  ),
                                ),
                                SizedBox(
                                  width: 119.w,
                                ),
                                Text(
                                  "Ghc 62/hr",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.mainColor,
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 0.1.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.sp,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.sp,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.sp,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.sp,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18.sp,
                                ),
                                SizedBox(
                                  width: 9.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.3.h),
                                  child: Text(
                                    "13 reviews",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.kLightGrey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppAssets.locationIcon,height: 16.h,),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/hired.png",
                              height: 16.h,
                              // width: 2.w,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Text(
                              "Hired",
                              style: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          AppAssets.favUnselectedIcon,
                          // height: 2.h,
                          // width: 2.w,
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.2.w),
                      child: RichText(
                        text: TextSpan(
                          text: "Scheduled",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.kLightGrey,
                          ),
                          children: [
                            TextSpan(
                              text: " in progress",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: AppColors.mainColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "08-07-2020",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.welcomeTwiddle,
                                    fontFamily: "PoppinsBold"),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "Start Time",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "08:30 AM",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.welcomeTwiddle,
                                    fontFamily: "PoppinsBold"),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 60.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Hours",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "02 Hours",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.welcomeTwiddle,
                                    fontFamily: "PoppinsBold"),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "End Time",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.welcomeTwiddle,
                                ),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                "10:30 AM",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.welcomeTwiddle,
                                    fontFamily: "PoppinsBold"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4.5.w),
                      height: 35.h,
                      width: 152.w,
                      decoration: const BoxDecoration(
                        color: AppColors.kGreenAccent,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                          ),
                          SvgPicture.asset(AppAssets.greenCheckIcon,
                              color: AppColors.kWhite, height: 13.h),
                          SizedBox(
                            width: 8.w,
                          ),
                          Text(
                            "Mark as Completed",
                            style: TextStyle(
                                color: AppColors.kWhite, fontSize: 14.sp),
                          ),
                          SizedBox(width: 5.h,)
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 23.h,),
          ],
        );
      },
    );

    // Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();
    //
    // return StreamBuilder<QuerySnapshot>(
    //   stream: ref,
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
    //     if (snapshot.hasError){
    //       return Center(child: PoppinsText(text: "Something went wrong"));
    //     }
    //     else if (snapshot.connectionState == ConnectionState.waiting){
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     final data = snapshot.requireData;
    //     // var doc = snapshot.data?.docs[index].data();
    //     return ListView.builder(
    //         itemCount: data.size,
    //         itemBuilder: (context, index){
    //
    //           if(data.docs[index]['accType'] == 'Service Provider') {
    //             if (data.docs[index]['hired'] == 'true') {
    //               return Column(
    //                 children: [
    //
    //                   GestureDetector(
    //                     onTap: () {
    //                       Get.to(() =>
    //                           ServiceDetails(
    //                             uid: data.docs[index]['uid'],
    //                           ));
    //                     },
    //                     child: ServiceProviders(
    //                       name: data.docs[index]['name'],
    //                       profilePic: data.docs[index]['profilePic'],
    //                       profession: data.docs[index]['profession'],
    //                       price: data.docs[index]['price'],
    //                       location: data.docs[index]['location'],
    //                       verified: data.docs[index]['verified'],
    //                       available: data.docs[index]['available'],
    //                     ),
    //                   ),
    //                   Height()
    //                 ],
    //               );
    //             }
    //           }
    //           return Container();
    //         }
    //     );
    //   },
    // );

  }
}
class VerifiedServiceProviders extends StatelessWidget {
  const VerifiedServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: ref,
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

              if(data.docs[index]['accType'] == 'Service Provider'){
                if(data.docs[index]['verified'] == 'true') {
                  return Column(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Get.to(()=> ServiceDetails(
                            uid: data.docs[index]['uid'],
                          ));
                        },
                        child: ServiceProviders(
                          name: data.docs[index]['name'],
                          profilePic: data.docs[index]['profilePic'],
                          profession: data.docs[index]['profession'],
                          price: data.docs[index]['price'],
                          location: data.docs[index]['location'],
                          verified: data.docs[index]['verified'],
                          available: data.docs[index]['available'],
                        ),
                      ),
                      Height()
                    ],
                  );
                }
              }
              return Container();
            }
        );
      },
    );
  }
}

class ServiceProviders extends StatelessWidget {
  String? name; String? available; String? verified;
  String? price; String? profession; String? profilePic; String? location; VoidCallback? vertTap;
  ServiceProviders({Key? key,
    this.name,
    this.verified,
    this.profession,
    this.available,
    this.price,
    this.profilePic,
    this.location,
    this.vertTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [


          MyContainer(
            shadowColor: shadowcolor,
            radius: 20, horizontalPadding: 20,
            verticalPadding: 20,color: white,
            child: Column(
              children: [

                Row(
                  children: [

                    verified == 'true'?
                    Stack(
                      children: [

                        Container(
                          height: Get.height/(812/60), width: Get.height/(812/60),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profilePic!)
                              )
                          ),


                        ),
                        Positioned(
                            right: 1, top: 1, height: Get.height/50, width: Get.height/50,
                            child: Image.asset('assets/verified.png'))
                      ],
                    ) : Container(
                        height: Get.height/(812/60), width: Get.height/(812/60),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(profilePic!)
                            )
                        )
                    ),

                    Width(size: 10,),

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          PoppinsText(text: '${name}', size: 14, fontWeight: FontWeight.w500),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(text: '${profession}', color: orange, size: 10,),
                              PoppinsText(text: 'Ghc ${price}/hr', color: maincolor, fontWeight: FontWeight.w500)
                            ],
                          ),

                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) =>
                                      Icon(Icons.star, size: 13.sp, color: star)
                                  )),
                              Width(),
                              PoppinsText(text: 'Reviews', size: 10, color: hinttext),
                            ],)

                        ],
                      ),
                    ),

                  ],
                ),


                Height(),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconText(icon: Icons.location_on, text: '${location}'),
                        Width(size: 10,),
                        available == 'Available'?
                        IconText(icon: Icons.check_circle, text: '${available}', color: active, iconColor: active,) :
                        IconText(icon: Icons.check_circle, text: '${available}', color: hinttext, iconColor: hinttext,)
                      ],
                    ),

                    MyContainer(
                      color: shadowcolor, height: 35, width: 35,
                      radius: 50,
                      child: Icon(Icons.bookmark_border, color: maincolor,),
                    )

                  ],
                ),


              ],
            ),
          ),

          Positioned(
            right: 5, top: 5,
            child: GestureDetector(
              onTap: vertTap,
              child: MyContainer(
                color: shadowcolor, height: 35, width: 35,
                radius: 50,
                child: Icon(Icons.more_vert),
              ),
            ),
          ),


        ]);
  }
}