import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:state_agent/constants/constants.dart';

import '../../Api_Services/user/google_controller.dart';

enum AccountType {
  realEstate, serviceProvider
}

class GoogleSignupScreen extends StatefulWidget {
  GoogleSignupScreen({Key? key}) : super(key: key);

  @override
  State<GoogleSignupScreen> createState() => _GoogleSignupScreenState();
}

class _GoogleSignupScreenState extends State<GoogleSignupScreen> {

  GoogleController googleController = Get.put(GoogleController());

  String type = 'Real Estate';
  AccountType acctype = AccountType.realEstate;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(

        body: Container(
          child: BG(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Height(size: 40),
                Center(child: SvgPicture.asset('assets/twiddle/welcome.svg')),
                Height(size: 20,),
                Center(child: PoppinsText(text: 'Welcome', size: 26, fontWeight: FontWeight.bold)),
                Height(size: 30),

                PoppinsText(text: 'Select Type:', size: 18, fontWeight: FontWeight.w500),
                Height(size: 15,),

                GestureDetector(
                  onTap: (){
                    setState((){
                      acctype = AccountType.realEstate;
                      type = 'Real Estate';
                    });
                  },
                  child: Row(
                      children: [

                        Radio(
                            activeColor: maincolor,
                            value: AccountType.realEstate,
                            groupValue: acctype,
                            onChanged: (AccountType? val){
                              setState((){
                                acctype = val!;
                                type = 'Real Estate';
                              });
                            }
                        ),
                        PoppinsText(
                          text: 'Real Estate',
                          fontWeight: FontWeight.w500,
                          color: acctype == AccountType.realEstate? maincolor : black,
                        )
                      ]
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    setState((){
                      acctype = AccountType.serviceProvider;
                      type = 'Service Provider';
                    });
                  },
                  child: Row(
                      children: [

                        Radio(
                            activeColor: maincolor,
                            value: AccountType.serviceProvider,
                            groupValue: acctype,
                            onChanged: (AccountType? val){
                              setState((){
                                acctype = val!;
                                type = 'Service Provider';
                              });
                            }
                        ),
                        PoppinsText(
                          text: 'Service Provider',
                          fontWeight: FontWeight.w500,
                          color: acctype == AccountType.serviceProvider? maincolor : black,
                        )
                      ]
                  ),
                ),

                Height(size: 20,),
                Iconbutton(
                  radius: 30,
                  MyIcon: SvgPicture.asset('assets/google.svg'),
                  borderColor: hinttext,
                  buttonColor: white, color: maincolor,
                  text: 'Sign in with Google',
                  onTap: (){

                      // final provider = Provider.of<GoogleSigninProvider>(context, listen: false);
                      // provider.googleSignin(type);

                    // googleController.googleSingup(type);

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BG extends StatelessWidget {
  Widget? child;
  BG({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [


        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.66,
              child: Image.asset("assets/login.png",fit: BoxFit.cover),
            )),

        Positioned(
            top: 40, left: 15,
            child: MyBackButton(
              color: white,
              iconColor: black,
            )
        ),


        Positioned.fill(
          top: Get.height * 0.30,
          child: Container(
            height: Get.height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
