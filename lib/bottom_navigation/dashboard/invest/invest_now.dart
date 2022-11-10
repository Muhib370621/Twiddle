import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../../Utilities/widgets.dart';
import '../../../Screens/bottom_navi/drawer_screen/install_dash/your_install.dart';
import '../../../Screens/bottom_navi/home_screen/dashboard_screen.dart';
import '../../twiddle_wallet/invest/dashboard_investment.dart';
import 'invest_details.dart';

class InvestNow extends StatefulWidget {
  @override
  _InvestNowState createState() => _InvestNowState();
}

class _InvestNowState extends State<InvestNow> {
  RangeValues values = RangeValues(0, 7000);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: white,
          body:SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(

                  margin: EdgeInsets.only(top: 50.h),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 15.w),
                            height: 40.h, width: 40.h,
                            decoration: BoxDecoration(
                                color: maincolor,
                                borderRadius: BorderRadius.circular(30.r)
                            ),
                            child: Icon(Icons.arrow_back_ios_new_outlined, color: white, size: 15.sp),
                          )),


                      SizedBox(width: 10),
                      mytextbold("INVEST NOW", 14, black)
                    ]
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: mytextbold("Twiddle Projects", 20, maincolor)
                ),

                SizedBox(height: 20,),

                Container(
                  height: 40,
                  child: TabBar(
                      labelColor: Color(0xff0336FF),
                      unselectedLabelColor: black,
                      tabs: [
                        Tab(
                          child: PoppinsText(text: 'All Projects')),
                        Tab(
                            child: PoppinsText(text: 'Your Projects')),
                        InkWell(
                          onTap: (){
                            Get.to(()=>DashboardInvest());
                          },
                          child: Tab(
                              child: PoppinsText(text: 'Dashboard')),
                        ),

                      ]),
                ),

                SizedBox(height: 30.h),

                Container(
                  height: Get.height*0.7,
                  child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: silver.withOpacity(0.2),//Color(0xffF2F6FE).withOpacity(1),
                                    spreadRadius: 4,
                                    blurRadius: 10,
                                    offset: Offset(0, 7),
                                  ),],
                                borderRadius: BorderRadius.circular(15.r),
                              color: white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                InkWell(
                                  onTap: (){Get.to(()=>InvestDetails());},
                                  child: Container(
                                    width: Get.width,
                                    height: Get.height*0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/background.png")
                                        )
                                    ),
                                    //child: Image.asset("assets/background.png", fit: BoxFit.cover),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),

                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
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
                                                fontWeight: FontWeight.bold),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              Get.to(()=>InvestDetails());
                                            },
                                            child: MyContainer(
                                              width: 80,
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Icon(Icons.share,color: Color(0xff9C9C9C),size: 28),

                                                  Image.asset("assets/select.png",width: 40,height: 40)
                                                ],
                                              ),
                                            ),
                                          )

                                        ],
                                      ),


                                      SizedBox(height: 20),
                                      PoppinsText(text: "The Mall of Africa will be biggest and ultra modern Mall in Africa the world has seen. This project will encapsulate the cultural elements of all 55 count...",
                                        color: hinttext,
                                      ),

                                      SizedBox(height: 30),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            PoppinsText(text: "Min. Invesment: ", color: hinttext),
                                            PoppinsText(text: "GHC5", color: maincolor),
                                          ],),
                                          PoppinsText(text: "100 days left", color: hinttext)
                                        ],),


                                      SizedBox(height: 20),
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

                                      SizedBox(height: 20),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "Project Cost:", color: hinttext),
                                            PoppinsText(text: "Invested so far", color: hinttext)
                                          ]),


                                      SizedBox(height: 10),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "GHC150,000", color: maincolor),
                                            Row(children: [
                                              PoppinsText(text: "GHC53,593"),
                                              SizedBox(width: 3),
                                              PoppinsText(text: "(46%)", color: maincolor)
                                            ],)
                                          ]),

                                      SizedBox(height: 30),
                                      Center(child: PoppinsText(text: "A Twiddle inc, ltd Original 2022, ALl Rights Reserved", color: hinttext)),

                                      SizedBox(height: 30),



                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: silver.withOpacity(0.2),//Color(0xffF2F6FE).withOpacity(1),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 7),
                                ),],
                              borderRadius: BorderRadius.circular(15.r),
                              color: white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                InkWell(
                                  onTap: (){Get.to(()=>InvestDetails());},
                                  child: Container(
                                    width: Get.width,
                                    height: Get.height*0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage("assets/background.png")
                                        )
                                    ),
                                    //child: Image.asset("assets/background.png", fit: BoxFit.cover),
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),

                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: PoppinsText(
                                                text: 'Mall Of Africa In Ghana Seed This Project',
                                                size: 18,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          GestureDetector(
                                            onTap: () {
                                              Get.to(()=>InvestDetails());
                                            },
                                            child: MyContainer(
                                              width: 80,
                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Icon(Icons.share,color: Color(0xff9C9C9C),size: 28),

                                                  Image.asset("assets/select.png",width: 40,height: 40)
                                                ],
                                              ),
                                            ),
                                          )

                                        ],
                                      ),


                                      SizedBox(height: 20),
                                      PoppinsText(text: "The Mall of Africa will be biggest and ultra modern Mall in Africa the world has seen. This project will encapsulate the cultural elements of all 55 count...",
                                        color: hinttext,
                                      ),

                                      SizedBox(height: 30),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            PoppinsText(text: "Min. Invesment: ", color: hinttext),
                                            PoppinsText(text: "GHC5", color: maincolor),
                                          ],),
                                          PoppinsText(text: "100 days left", color: hinttext)
                                        ],),


                                      SizedBox(height: 20),
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

                                      SizedBox(height: 20),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "Project Cost:", color: hinttext),
                                            PoppinsText(text: "Invested so far", color: hinttext)
                                          ]),


                                      SizedBox(height: 10),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "GHC150,000", color: maincolor),
                                            Row(children: [
                                              PoppinsText(text: "GHC53,593"),
                                              SizedBox(width: 3),
                                              PoppinsText(text: "(46%)", color: maincolor)
                                            ],)
                                          ]),

                                      SizedBox(height: 30),
                                      Center(child: PoppinsText(text: "A Twiddle inc, ltd Original 2022, ALl Rights Reserved", color: hinttext)),

                                      SizedBox(height: 30),



                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: silver.withOpacity(0.2),//Color(0xffF2F6FE).withOpacity(1),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 7),
                                ),],
                              borderRadius: BorderRadius.circular(15.r),
                              color: white,
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  width: Get.width,
                                  height: Get.height*0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15)
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("assets/background.png")
                                      )
                                  ),
                                  //child: Image.asset("assets/background.png", fit: BoxFit.cover),
                                ),

                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),

                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: PoppinsText(
                                                text: 'Mall Of Africa In Ghana Seed This Project',
                                                size: 18,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold),
                                          ),

                                          MyContainer(
                                            width: 80,
                                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.share,color: Color(0xff9C9C9C),size: 28),

                                                Image.asset("assets/select.png",width: 40,height: 40)
                                              ],
                                            ),
                                          )

                                        ],
                                      ),


                                      SizedBox(height: 20),
                                      GestureDetector(
                                        onTap: ()=> Get.to(()=> InvestDetails()),
                                        child: PoppinsText(text: "The Mall of Africa will be biggest and ultra modern Mall in Africa the world has seen. This project will encapsulate the cultural elements of all 55 count...",
                                          color: hinttext,
                                        ),
                                      ),

                                      SizedBox(height: 30),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(children: [
                                            PoppinsText(text: "Min. Invesment: ", color: hinttext),
                                            PoppinsText(text: "GHC 5", color: maincolor),
                                          ],),
                                          PoppinsText(text: "100 days left", color: hinttext)
                                        ],),


                                      SizedBox(height: 20),
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

                                      SizedBox(height: 20),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "Project Cost:", color: hinttext),
                                            PoppinsText(text: "Invested so far", color: hinttext)
                                          ]),


                                      SizedBox(height: 10),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            PoppinsText(text: "GHC150,000", color: maincolor),
                                            Row(children: [
                                              PoppinsText(text: "GHC53,593"),
                                              SizedBox(width: 3),
                                              PoppinsText(text: "(46%)", color: maincolor)
                                            ],)
                                          ]),

                                      SizedBox(height: 30),
                                      Center(child: PoppinsText(text: "A Twiddle inc, ltd Original 2022, ALl Rights Reserved", color: hinttext)),

                                      SizedBox(height: 30),



                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: (){
                        //     Get.to(RenterInstall());
                        //   },
                        //   child: RenterInstall(),
                        // )
                      ]
                  ),
                ),


              ],
            ),
          ),
        )
    );







      DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 40),
                Row(
                  children: [
                    RoundBackButton(),
                    SizedBox(width: 10),
                    Text("INVEST NOW", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))

                  ],
                ),
                SizedBox(height: 30),
                Text("Twiddle Projects", style: TextStyle(color: Color(0xff0336FF), fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 25),
                TabBar(
                  tabs: [
                    Text("All Projects", style: TextStyle(color: Colors.black,fontSize: 15)),
                    Text("Your Projects", style: TextStyle(color: Colors.black,fontSize: 15)),
                    Text("Dashboard", style: TextStyle(color: Colors.black,fontSize: 15)),
                  ]),
                Expanded(
                    child: TabBarView(
                      children: [
                        Column(),
                        Column(),
                        Column()
                      ],
                    )
                )






              ],
            ),
          ),

        )
    );








      Scaffold(
      body: Padding(padding: EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40,),
              Row(children: [
                Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Icon(Icons.arrow_back_ios, color: Colors.white,)),
                SizedBox(width: 20,),
                Text("INVEST NOW", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)
              ],),
              SizedBox(height: 25,),
              Text("Twiddle Projects", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 10,),
              DefaultTabController(length: 3,
                  child: TabBar(
                      tabs: [
                        Text("All Projects", style: TextStyle(color: Colors.black)),
                        Text("Your Projects", style: TextStyle(color: Colors.black)),
                        Text("Dashboard", style: TextStyle(color: Colors.black)),
                      ])),
              SizedBox(height: 30,),
              Card(
                child: Column(children: [
                  Container(
                    width: width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Image.asset("assets/background.png", fit: BoxFit.cover),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(children: [
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("MAll Of Africa In Ghana \n Seed This Project",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                          Row(children: [Icon(Icons.share),
                            SizedBox(width: 20,),
                            Icon(Icons.save, color: Colors.pink,)],)
                        ],),
                      Text("The most of African will be biggest and ultra modern Mall in Africa the world has seen. This project will encapsulate the cultural of all 55 countries in the continent"
                          , style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Text("Min. Invesment: "),
                            Text("GHC5", style: TextStyle(color: Colors.blue)),
                          ],),
                          Text("100 days left", style: TextStyle(color: Colors.black54))
                        ],),
                      SizedBox(height: 20,),
                      LinearProgressIndicator(color: Colors.black12,
                      ),
                      SizedBox(height: 20,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Project Cost:", style: TextStyle(color: Colors.black54)),
                            Text("Invested so far", style: TextStyle(color: Colors.black54))
                          ]),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("GHC150,000", style: TextStyle(color: Colors.blue)),
                            Row(children: [
                              Text("GHC53,593"),
                              Text("(46%)", style: TextStyle(color: Colors.blue))
                            ],)
                          ]),
                      SizedBox(height: 20,),
                      Text("A Twiddle inc, ltd Original 2022, ALl Rights Reserved",
                        style: TextStyle(
                            color: Colors.black54
                        ),),
                      SizedBox(height: 20,),
                    ],),)
                ],),
              ),
            ],),
        ),),
    );
  }
}