import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpDesk extends StatefulWidget {
  const HelpDesk({Key? key}) : super(key: key);

  @override
  State<HelpDesk> createState() => _HelpDeskState();
}

class _HelpDeskState extends State<HelpDesk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0336FF),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Row(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);},
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Icon(Icons.arrow_back_ios,size: 14,),
                              ),
                            ),
                          ),
                          SizedBox(width: 7,),
                          Text('Back', style: TextStyle(color: Colors.white, fontSize: Get.height * 0.02, letterSpacing: 0.1,),)


                        ],
                      ),

                      SizedBox(height: 50,),

                      Center(child: Text("Request Help",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.bold
                          ))),

                      // Padding(padding: const EdgeInsets.only(left: 40), child: Image.asset("assets/infdesk.png",width: 400,height: 145),),






                    ],
                  ),
                )

            ),
            Positioned(
              top: 250,
              right: 0,
              child: SvgPicture.asset("assets/Path.svg",width: Get.width,height: Get.height),



            ),
            Positioned(
                top: 380,
                right: 0,
                left: 0,
                child:  Column(

                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text("How can we help you?",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

                    SizedBox(height: 20,width: 10,),

                    Text("It looks like you are experiencing problems\n "
                        "with our process. We are here to help \n"
                        "so please get in touch with us",style: TextStyle(fontSize: 13,color: Colors.black),textAlign: TextAlign.center,),

                    SizedBox(height: 30),


                    Container(
                      width: Get.width*0.4,
                      height: Get.height*0.19,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(
                            color: Color(0xffF2F6FE).withOpacity(1),
                            spreadRadius: 10,
                            blurRadius: 10,
                            offset: Offset(0, 2),
                          )]
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/emailicon.png',width: 70,height: 70),
                          SizedBox(height: 5),
                          Text("Email us",style: TextStyle(fontSize: 14,color: Colors.black),)
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                  ],
                ),

            )
          ],
        )

    );
  }
}
