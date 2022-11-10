import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import 'pay_now.dart';



class InvestDetails extends StatefulWidget {
  @override
  _InvestDetailsState createState() => _InvestDetailsState();
}

class _InvestDetailsState extends State<InvestDetails> {
  RangeValues values = RangeValues(0, 7000);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: BG(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Height(size: 25),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: PoppinsText(
                                text: 'Mall Of Africa In Ghana Seed This Project',
                                size: 18,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w500),
                          ),

                          MyContainer(
                            width: 80,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.share,color: Color(0xff9C9C9C),size: 28),

                                Image.asset("assets/select.png",width: 40,height: 40)
                              ],
                            ),
                          ),
                        ],
                      ),

                      Height(),

                      Row(
                        children: [
                          PoppinsText(text: 'Min. Investment: ', color: hinttext),



                          Expanded(
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PoppinsText(text: 'GHC ', color: maincolor),
                                PoppinsText(text: '100 days left', color: hinttext)
                              ],
                            ),
                          )

                        ],
                      ),

                      RangeSlider(
                          values: values,
                          min: 0,
                          max: 20000,
                          divisions: 02,
                          activeColor: Color(0xff0336FF),
                          labels: RangeLabels(
                            values.start.round().toString(),
                            values.end.round().toString(),
                          ),
                          onChanged: (values) {
                            setState(() {
                              this.values = values;
                            });
                          }
                      ),

                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(text: 'Project Cost: ', color: hinttext),
                          PoppinsText(text: 'Invested so far:', color: hinttext),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PoppinsText(text: 'GHC150,000', color: maincolor),
                          Row(
                            children: [
                              PoppinsText(text: 'GHC53.593 '),
                              PoppinsText(text: '(46%)', color: maincolor),

                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),


                Height(size: 15),
                MyDivider(),

                MyContainer(
                  height: 50,
                  child: TabBar(
                      isScrollable: true,
                      labelColor: maincolor,
                      tabs: [

                        PoppinsText(text: 'Description'),
                        PoppinsText(text: 'Gallery'),
                        PoppinsText(text: 'Project News'),
                        PoppinsText(text: 'Contributors'),

                      ]
                  ),
                ),
                MyDivider(),
                Height(size: 20),

                Expanded(
                    child: TabBarView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, right: 5.w, top: 10.h),
                          child: PoppinsText(
                              text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo.'
                          ),
                        ),
                        SingleChildScrollView(
                          child:  Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset('assets/g1.png', scale: 1.3, width: Get.width * 0.35),
                                SizedBox(width: 10),
                                Column(
                                  children: [
                                    SizedBox(height: Get.height * 0.036),
                                    Image.asset('assets/g2.png', scale: 1.7),
                                    SizedBox(height: 10),
                                    Image.asset('assets/g3.png', scale: 2.5),
                                    SizedBox(height: Get.height * 0.036),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child:Padding(
                            padding: EdgeInsets.only(left: 15.w, right: 5.w),
                            child: PoppinsText(
                                text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.\n\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.\n\n Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam.'
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Height(size: 20),
                              Contributions(
                                assetName: 'assets/tw/pipe.png',
                                name: 'Pipe Bank LLC',
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),

              ],
            ),
          ),
        )

    );
  }
}

class Contributions extends StatelessWidget {
  String? assetName; String? url; String? name;
  Contributions({Key? key, this.assetName, this.url, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      horizontalPadding: 10,
      horizontalMargin: 15, radius: 15,
      verticalPadding: 10, color: white,
      shadowColor: maincolor.withOpacity(0.1),
      child: Row(
        children: [

          Picture(
            size: 30,
            asset: assetName,
          ),
          Width(size: 10),
          PoppinsText(text: name!, size: 10)

        ],
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
      children:<Widget> [


        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height/(812/375),
              child: Image.asset("assets/background.png",fit: BoxFit.cover),
            )),

        Positioned(
            top: 30,
            left: 20,
            child: InkWell(
                onTap: (){Navigator.pop(context);},
                child:  Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.arrow_back_ios_rounded, color: Color(0xff0336FF), size: 17),
                  ),
                )
            )


        ),

        Positioned.fill(
          top: Get.height * 0.3,
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)
                )
            ),
            child: child,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(bottom: 15.h),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Button(
                shadowColor: maincolor.withOpacity(0.1),
                onTap: ()=> Get.to(()=> InvestScreen()),
                width: 160,
                text: 'Invest Now',
              )

          ),
        ),

      ],
    );
  }
}
