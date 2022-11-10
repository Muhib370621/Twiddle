import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/dashboard/invest/invest_now.dart';
import 'package:state_agent/bottom_navigation/tenants/my_tenants.dart';

import '../../constants/constants.dart';
import '../../property/property_ads/property_ad.dart';
import '../../property/property_details.dart';
import '../twiddle_wallet/twiddle_wallet.dart';

class DashboardHeader extends StatelessWidget {
  String image; String name; VoidCallback? onDrawerTap;
  DashboardHeader({Key? key, this.name = 'John Recardo', this.onDrawerTap, this.image = ''}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.r),
          bottomLeft: Radius.circular(30.r)
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              maincolor, darkblue
            ]
        )
      ),
      child: Column(
        children: [


          // photoURL.isURL?
          // Container(
          //   height: 80, width: 80,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: white,
          //       width: 3
          //     ),
          //     image: photoURL == 'null'? DecorationImage(
          //         image: AssetImage('assets/person/mary.png')
          //     ) : DecorationImage(
          //       fit: BoxFit.cover,
          //         image: NetworkImage(photoURL)
          //     )
          //   ),
          // ) :
          // Container(
          //   height: 80, width: 80,
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border: Border.all(
          //           color: white,
          //           width: 3
          //       ),
          //       image: photoURL == 'null'? DecorationImage(
          //           image: AssetImage('assets/person/mary.png')
          //       ) : DecorationImage(
          //           image: FileImage(
          //               File(photoURL)
          //           )
          //       )
          //   ),
          // ),
//Uncomment below code to fetch photo from API and remove hard code circleavatar
          // image.isURL?
          // Picture(
          //   size: 80,
          //   url: image,
          //   borderColor: white,
          //   borderWidth: 3,
          // ) : Picture(
          //   size: 80,
          //   file: image,
          //   borderColor: white,
          //   borderWidth: 3,
          // ),
          CircleAvatar(radius:50,backgroundImage:AssetImage("assets/sp/otp.png"), ),
          Height(),
          PoppinsText(text: name, size: 18, fontWeight: FontWeight.w500, color: white,),
          Height(),
          MyContainer(
            horizontalMargin: 30,
            color: transparent,
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Iconbutton(
                        onTap: (){
                          Get.to(()=> InvestNow());
                        },
                          height: 45, shadowColor: transparent,
                          radius: 10, buttonColor: active, myIconsSize: 20,
                          MyIcon: SvgPicture.asset('assets/drawer/invest.svg'),
                          text: 'Invest Now'
                      ),
                    ),
                    Width(size: 10,),
                    Expanded(
                      child: Iconbutton(
                        onTap: (){
                          Get.to(()=> TwiddleWallet());

                        },
                          height: 45, shadowColor: transparent,
                          radius: 10, buttonColor: white, color: maincolor,
                          MyIcon: SvgPicture.asset('assets/walletic.svg'),
                          myIconsSize: 25,
                          text: 'My Wallet'
                      ),
                    )
                  ],
                ),
                Height(),
                Iconbutton(
                  onTap: () {
                    Get.to(()=> TenantsList());
                  },
                    radius: 15, shadowColor: transparent,
                    myIconsSize: 20, buttonColor: white,
                    color: maincolor, height: 50,
                    MyIcon: SvgPicture.asset('assets/tenants.svg'),
                    text: 'My Tenants'
                ),
                Height(size: 20,),
              ],
            ),
          ),


        ],
      ),
    );
  }
}

class ProfileProperty extends StatelessWidget {
  String? currentUserId;
  ProfileProperty({Key? key, this.currentUserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ref = FirebaseDatabase.instance.ref('Property');

    return FirebaseAnimatedList(
      query: ref,
      itemBuilder: (BuildContext context, DataSnapshot snapshot,
          Animation<double> animaiton, int index){


        var value = Map<String, dynamic>.from(snapshot.value as Map);

        var uid = value['uid'];

        if (uid == currentUserId){
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


class Appbar extends StatelessWidget {
  VoidCallback? onDrawerTap;
  Appbar({Key? key, this.onDrawerTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      color: transparent,
      horizontalPadding: 10.w,
      verticalPadding: 10.h,
      child: Row(
        children: [

          GestureDetector(
            onTap: onDrawerTap,
            child: MyContainer(
              height: 40, width: 40, radius: 40,
              horizontalPadding: 5, verticalPadding: 5,
              color: white,
              child: Icon(FontAwesomeIcons.barsStaggered),
            ),
          ),

          Expanded(child: Container()),

          MyContainer(
            height: 40, width: 40, radius: 40,
            horizontalPadding: 8, verticalPadding: 8,
            color: white,
            child: SvgPicture.asset('assets/drawer/setting.svg', color: maincolor),
          ),
          Width(size: 10),

          MyContainer(
            height: 40, width: 40, radius: 40,
            horizontalPadding: 8, verticalPadding: 8,
            color: white,
            child: SvgPicture.asset('assets/drawer/notification.svg', color: maincolor),
          ),

          Width(size: 10),

          MyContainer(
            height: 40, width: 40, radius: 40,
            horizontalPadding: 8, verticalPadding: 8,
            color: white,
            child: SvgPicture.asset('assets/chat.svg', color: maincolor),
          ),

        ],
      ),
    );
  }
}