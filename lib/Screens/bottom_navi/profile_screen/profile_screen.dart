import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/drawer_screen/setting_screen/setting_screen.dart';
import 'package:state_agent/bottom_navigation/drawer/help/help.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/methods.dart';

import '../../../constants/get_date_time.dart';
import '../../../service_provider/verification.dart';
import 'edit_myProfile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _switchTwoLock = true;
  bool _switchTouch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Height(size: 60),

              // user['accType'] == 'Service Provider'?
              // Align(
              //   alignment: Alignment.topRight,
              //   child: GestureDetector(
              //       onTap: (){
              //         getDateTime();
              //         setStatus('last seen at ${time}');
              //         logout();
              //       },
              //       child: PoppinsText(text: 'Log Out', size: 14, color: maincolor, fontWeight: FontWeight.w700,)
              //   ),
              // ) : Container(),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: (){
                      getDateTime();
                      setStatus('last seen at ${time}');
                      logout();
                    },
                    child: PoppinsText(text: 'Log Out', size: 14, color: maincolor, fontWeight: FontWeight.w700,)
                ),
              ),

              SpDp(
                pic: authUser['profilePic'],
                verified: authUser['verified'],
              ),

              SizedBox(height: 20),
              Center(
                  child: PoppinsText(text: authUser['name'], color: black, fontWeight: FontWeight.bold, size: 18)
              ),
              SizedBox(height: 5),
              Center(child: PoppinsText(text: authUser['accType'], color: bluetext)
              ),
              Height(size: 20),
              profile(onTap: (){Get.to(()=>EditProfile());},title: "My Profile"),
              SizedBox(height: 20),
              PoppinsText(text: "Security & Settings", color: black, size: 15, fontWeight: FontWeight.w500),
              Height(size: 15),
              Container(
                width: Get.width,
                height: Get.height*0.075,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(width: 1,color: Color(0xffE9E9EC))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText(text: "Two-Factor Verification", size: 14, fontWeight: FontWeight.w500),


                      Transform.scale(
                        scale: 0.7,
                        child:  CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: _switchTwoLock,
                          onChanged: (value) {
                            setState(() {
                              _switchTwoLock = value;
                            });
                          },
                        ),
                      )



                    ],
                  ),
                ),
              ),
              Height(size: 15),
              Container(
                width: Get.width,
                height: Get.height*0.075,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(width: 1,color: Color(0xffE9E9EC))
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText(text: "Enable Touch ID", size: 14, fontWeight: FontWeight.w500),

                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: _switchTouch,
                          onChanged: (value) {
                            setState(() {
                              _switchTouch = value;
                            });
                          },
                        ),
                      )



                    ],
                  ),
                ),
              ),

              Height(size: 15),
              profile(onTap: (){Get.to(()=>HelpDesk());},title: "Help & Support"),
              Height(size: 15),
              profile(onTap: (){Get.to(()=>MySetting());},title: "App Settings"),
              Height(size: 15),

              authUser['accType'] == 'Service Provider'?
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
                            child: PoppinsText(text: 'Identity Verification', size: 14, color: Colors.white,)
                        ),
                        Icon(Icons.arrow_circle_right_outlined, color: white),

                      ],
                    ),
                  )
              ) : Container(),

             Height(size: 30)



            ],
          ),
        )
      )
    );
  }




}
Widget profile({required VoidCallback onTap,String? title}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: Get.width,
      height: Get.height*0.075,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(width: 1,color: Color(0xffE9E9EC))
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PoppinsText(text: title!, size: 14, fontWeight: FontWeight.w500),
            Icon(Icons.arrow_forward,color: Color(0xff0336FF))
          ],
        ),
      ),
    )
  );
}

class SpDp extends StatelessWidget {
  String? pic; String? verified; double size;
  SpDp({Key? key, this.verified, this.pic, this.size = 80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authUser['verified'] == 'true'?
    Center(
      child: Stack(
        children: [

          Container(
            height: Get.height/(812/size), width: Get.height/(812/size),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: pic == null? DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/adm.png')
                ) : DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pic!)
                )
            ),
          ),
          Positioned(
            right: 1, top: 1,
            child: Container(
                height: Get.height/(812/20), width: Get.height/(812/20),
                child: Image.asset('assets/verified.png')),
          )

        ],
      ),
    ) : Center(
      child: Container(
        height: Get.height/(812/size), width:Get.height/(812/size),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: pic != null? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(pic!)
            ) : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/adm.png')
            )
        ),
      ),
    );
  }
}








