import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/service_screen/summary_service.dart';
import 'package:state_agent/constants/methods.dart';
import 'package:state_agent/reviews_page.dart';

import '../../../bottom_navigation/chat_screen/messages.dart';
import '../../../constants/constants.dart';
import '../../../new/report_service_provider.dart';




class ServiceDetails extends StatefulWidget {
String? uid;
  ServiceDetails({Key? key, this.uid}) : super(key: key);

  @override
  State<ServiceDetails> createState() => _ServiceDetailsState();
}

var sp;
class _ServiceDetailsState extends State<ServiceDetails> {

  @override
  void initState() {
    getProvider();
    super.initState();
  }

  getProvider() async{
    QuerySnapshot psSnap = await firestore.collection('users').where('uid', isEqualTo: widget.uid).get();
    setState(() {
      sp = psSnap.docs[0].data();
    });
  }

  TimeOfDay? time= const TimeOfDay(hour: 6, minute: 25);
  TimeOfDay? timeEnd= const TimeOfDay(hour: 8, minute: 25);


  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    if(sp == null){
      return Scaffold(
        body: Container(
          width: Get.width, height: Get.height,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: BackButtonText(text: sp['name'], size: 24, fontWeight: FontWeight.bold),
        backgroundColor: white,
        automaticallyImplyLeading: false,
        shadowColor: transparent,
      ),

      body: Container(
        width: Get.width, height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Height(size: 20),

              Container(
                height: 695,
                child: Stack(
                  children: [

                    Positioned(
                      child: MyContainer(
                        shadowColor: maincolor.withOpacity(0.15),
                        horizontalPadding: 20,
                        verticalPadding: 20,
                        radius: 20, height: 671,
                        color: white,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [


                                SpDp(),

                                Width(size: 10),
                                Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      PoppinsText(text: sp['name'], fontWeight: FontWeight.bold,),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          PoppinsText(text: sp['profession'], size: 10, color: orange),
                                          PoppinsText(text: 'Ghc ${sp['price']}/hr', size: 14, color: maincolor, fontWeight: FontWeight.w500)
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Get.to(()=> ReviewsPage());
                                        },
                                        child: Row(
                                          children: [
                                            Wrap(
                                              children: List.generate(5, (index) =>
                                                  Icon(Icons.star, color: star, size: 12.sp))
                                            ),
                                            Width(),
                                            PoppinsText(text: 'reviews', size: 10, color: hinttext)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Height(size: 15),
                            PoppinsText(text: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.', color: hinttext),
                            Height(),
                            Row(
                              children: [
                                IconText(
                                  icon: Icons.location_on,
                                  text: sp['location'],
                                ),
                                Width(size: 20),
                                IconText(
                                  icon: Icons.verified,
                                  iconColor: sp['available'] == 'Available'? active: hinttext,
                                  text: sp['available'],
                                  color: sp['available'] == 'Available'? active: hinttext,
                                )
                              ],
                            ),
                            Height(size: 15),
                            GestureDetector(
                              onTap: (){
                                Get.to(()=>ChatRoom(
                                  receiverId: '${widget.uid}',
                                ));
                              },
                              child: Iconbutton(
                                icon: Icons.messenger,
                                text: 'Contact',
                                buttonColor: purple,
                                radius: 40,
                                shadowColor: purple.withOpacity(0.3),
                                width: 130, height: 40,
                              ),
                            ),
                            Height(size: 20),
                            PoppinsText(text: 'Schedule', size: 14, fontWeight: FontWeight.bold),
                            Height(),
                            PoppinsText(text: 'Date'),
                            Height(),
                            MyContainer(
                              horizontalPadding: 20, verticalPadding: 10,
                              color: shadowcolor, radius: 10,
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  PoppinsText(text: '08-07-2021'),
                                  Icon(Icons.calendar_month, color: maincolor,)
                                ],
                              ),
                            ),
                            Height(),
                            PoppinsText(text: 'Start Time'),
                            Height(),
                            MyContainer(
                              horizontalPadding: 20, verticalPadding: 10,
                              color: shadowcolor, radius: 10,
                              child: PoppinsText(text: '08:30 AM'),
                            ),
                            Height(),
                            PoppinsText(text: 'End Time'),
                            Height(),
                            MyContainer(
                              horizontalPadding: 20, verticalPadding: 10,
                              color: shadowcolor, radius: 10,
                              child: PoppinsText(text: '08:30 AM'),
                            ),
                            Height(),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PoppinsText(text: 'Total Hours'),
                                PoppinsText(text: 'Total Amount')
                              ],
                            ),
                            Height(),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                PoppinsText(text: '02 Hours', fontWeight: FontWeight.w500),
                                PoppinsText(text: '900 GHC', fontWeight: FontWeight.w500)
                              ],
                            ),
                            Height(size: 20),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      right: 5, top: 5,
                      child: GestureDetector(
                        onTap: (){
                          showDialog(
                              context: (context),
                              builder: (context)=>
                                  Dialog(
                                    alignment: Alignment.topRight,
                                    child: MyContainer(
                                      radius: 15,
                                      width: 20, shadowColor: transparent,
                                      horizontalPadding: 15.w, verticalPadding: 10.h,
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          GestureDetector(
                                              onTap: (){
                                                Get.to(()=>ReportServiceProvider(
                                                  email: sp['email'],
                                                ));
                                              },
                                              child: PoppinsText(text: 'Report', size: 10)),
                                          PoppinsText(text: 'Blacklist', size: 10),

                                        ],
                                      ),
                                    ),
                                  )
                          );
                        },
                        child: MyContainer(
                          width: 35, height: 35,
                          color: shadowcolor,
                          radius: 50,
                          child: Icon(Icons.more_vert_outlined),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 0, left: 62.w,
                      child: GestureDetector(
                        onTap: (){
                          if(sp['available'] == 'Available') {
                            Get.to(() => SummaryService());
                          }
                          else{
                            Fluttertoast.showToast(msg: 'Service Provider is Unavailable', gravity: ToastGravity.TOP);
                          }
                        },
                        child: Button(
                          text: 'Hire Now',
                          buttonColor: sp['available'] == 'Available'? active: hinttext,
                          shadowColor: sp['available'] == 'Available'? active.withOpacity(0.7): transparent,
                          width: 250,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class SpDp extends StatelessWidget {
  const SpDp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return sp['verified'] == 'true'?
    Center(
      child: Stack(
        children: [

          Container(
            height: Get.height/(812/60), width: Get.height/(812/60),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: sp['profilePic'] == null? DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/adm.png')
                ) : DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(sp['profilePic']!)
                )
            ),
          ),
          Positioned(
            right: 1, top: 1,
            child: Container(
                height: Get.height/(812/15), width: Get.height/(812/15),
                child: Image.asset('assets/verified.png')),
          )

        ],
      ),
    ) : Center(
      child: Container(
        height: Get.height/(812/60), width:Get.height/(812/60),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: sp['profilePic'] != null? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(sp['profilePic'])
            ) : DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/adm.png')
            )
        ),
      ),
    );
  }
}