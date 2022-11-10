import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/chat_screen/messages.dart';
import 'package:state_agent/constants/constants.dart';

class TenantProfile extends StatelessWidget {
  String? name; String? phone; String? email; String? photoUrl;
  double rentPaid; double remainingRent; String? uid;
  TenantProfile({Key? key,
  this.photoUrl, this.email, this.name, this.phone, this.remainingRent = 0,
  this.rentPaid = 0, this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Height(size: 20),
              BackButtonText(text: 'Tenant Profile', size: 16),

              Height(size: 20),


              Profile(
                uid: uid,
                photoUrl: photoUrl,
                phone: phone,
                email: email,
                name: name,
              )

              
            ],
          ),
        ),
      ),
    );
  }
}


class Profile extends StatelessWidget {
  String? name; String? phone; String? email; String? photoUrl;
  double rentPaid; double remainingRent; String? uid;
  Profile({Key? key,
    this.photoUrl, this.email, this.name, this.phone, this.remainingRent = 0,
    this.rentPaid = 0, this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 15, verticalPadding: 15,
      shadowColor: maincolor.withOpacity(0.15),
      color: white, radius: 20,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.height/(812/60), height: Get.height/(812/60),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image: photoUrl != null? DecorationImage(
                      fit: BoxFit.cover,
                        image: NetworkImage(photoUrl!)
                    ) : DecorationImage(
                        image: AssetImage('assets/adm.png')
                    )
                ),
              ),

              MyContainer(
                width: 40, height: 40, radius: 30,
                color: shadowcolor,
                child: Icon(Icons.more_vert),
              )

            ],
          ),

          Height(size: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(text: 'Name:', color: hinttext,),
              PoppinsText(text: name!),
            ],
          ),


          Height(size: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(text: 'Phone Number:', color: hinttext,),
              PoppinsText(text: phone!),
            ],
          ),

          Height(size: 15),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PoppinsText(text: 'Email:', color: hinttext,),
              PoppinsText(text: email!),
            ],
          ),

          Height(size: 20),

          GestureDetector(
            onTap: (){
              Get.to(()=> ChatRoom(
                receiverId: uid!,
              ));
            },
            child: Iconbutton(
              icon: Icons.messenger,
              text: 'Contact', radius: 30,
              buttonColor: purple, height: 45,
              shadowColor: purple.withOpacity(0.3),
            ),
          ),

          Height(size: 20,),

          MyContainer(
            horizontalPadding: 15, verticalPadding: 15,
            borderColor: black, radius: 20,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                Column(
                  children: [
                    PoppinsText(text: 'Rent Paid'),
                    PoppinsText(text: 'GHC ${rentPaid}', size: 16, fontWeight: FontWeight.w500, color: maincolor,),
                  ],
                ),

                MyContainer(color: black, height: 40, width: 1,),

                Column(
                  children: [
                    PoppinsText(text: 'Rent Remaining'),
                    PoppinsText(text: '-GHC ${remainingRent}', size: 16, fontWeight: FontWeight.w500, color: maincolor,),
                  ],
                )

              ],
            ),
          )


        ],
      ),
    );
  }
}