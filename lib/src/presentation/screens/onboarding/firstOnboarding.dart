import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_colors.dart';
import '../../../model/onboarding/onBoardModel.dart';
import '../../components/onboarding/dotIndicator.dart';
import '../../components/onboarding/onboardingBody.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  final List <OnBoard> pages = [
    OnBoard("Rent & Buy", "Home", "assets/notify.png"),
    OnBoard("Secure", "Payment", "assets/sheild.png"),
    OnBoard("Invest In", "Real Estate", "assets/rocket.png"),
  ];
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
                      // Get.off(()=>Authentication());
                    },
                    child: Container(
                      height: 30.h, width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.w),
                          color: AppColors.mainBg
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
                      Padding(padding: const EdgeInsets.only(right: 4),
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
                    //   else
                    //     Get.off(()=>Authentication());
                    },
                    child: Container(
                      height: 30.h, width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
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