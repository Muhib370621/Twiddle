import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_agent/Screens/user_auth/accountSelection.dart';
import 'package:state_agent/constants/constants.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  PageController pageController = PageController();
  int selectedIndex = 0;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [


          PageView.builder(
              itemCount: pages.length,
              controller: pageController,
              onPageChanged: (index){
                setState(() {
                  selectedIndex = index;
                });
              },
              itemBuilder: (context, position){
                return OnboardBody(
                    text1: pages[position].text1,
                    text2: pages[position].text2,
                    image: pages[position].image
                );
              }),

          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  InkWell(
                    onTap: (){
                      Get.off(()=>AccountSelection());
                    },
                    child: Container(
                      height: 30.h, width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Color(0xffEDE8FF)
                      ),
                      child: Center(
                          child: Text("Skip",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "Poppins, Regular"
                            ),)),
                    ),
                  ),

                  Row(children:
                    List.generate(pages.length, (index) =>
                      Padding(padding: EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == selectedIndex
                      ))
                    )
                  ,),

                  InkWell(
                    onTap: (){
                      if(selectedIndex <= 1){
                        pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                      }
                      else
                        Get.off(()=>AccountSelection());
                    },
                    child: Container(
                      height: 30.h, width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Center(
                          child: Row(
                            children: [
                              Text("Next",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "Poppins, Regular",
                                  color: Colors.white
                                ),),
                              Icon(Icons.arrow_circle_right_outlined, size: 15.sp, color: Colors.white,)
                            ],
                          )),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),



    );
  }
}

class DotIndicator extends StatelessWidget {
  DotIndicator({
    Key? key,
  this.isActive = false}) : super(key: key);

  bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isActive?14.h: 7.h, width: isActive?14.h: 7.h,
      decoration: BoxDecoration(
        color: isActive?Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(12.r)
      ),
    );
  }
}


class OnBoard{
  final String text1, text2, image;
  OnBoard(
      this.text1,
      this.text2,
      this.image
      );
}

final List <OnBoard> pages = [
  OnBoard("Rent & Buy", "Home", "assets/notify.png"),
  OnBoard("Secure", "Payment", "assets/sheild.png"),
  OnBoard("Invest In", "Real Estate", "assets/rocket.png"),
];

class OnboardBody extends StatelessWidget {
  const OnboardBody({Key? key,
    required this.text1,
    required this.text2,
    required this.image
  }) : super(key: key);


  final String text1;
  final String text2;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            height: double.infinity, width: double.infinity,
            // color: Color(0xff0336FF),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    maincolor,
                    darkblue
              ])
            ),
            //child: Image.asset("assets/bg.png", fit: BoxFit.cover,),
          ),
          Container(
            height: Get.height, width: Get.width,
            child: Column(
              children: [
                SizedBox(height: 90.h,),

                Image.asset("assets/logo1.png", height: 50.h, width: 165.w),
                SizedBox(height: 64.h,),
                Image.asset(image, height: 300.h, width: 300.h),
                SizedBox(height: 60.h,),
                Column(
                  children: [
                    Text(text1,
                      style: GoogleFonts.quicksand(
                          fontSize: 40.sp,
                          color: Colors.white
                      ),),

                    Text(text2,  style: GoogleFonts.quicksand(
                      fontSize: 40.sp,
                      color: Colors.white
                    ),)
                  ],
                ),



              ],
            ),
          ),
        ]);
  }
}

