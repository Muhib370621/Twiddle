import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/Screens/bottom_navi/service_screen/service_details.dart';
import 'package:state_agent/constants/constants.dart';
import 'package:state_agent/constants/methods.dart';


class HiredService extends StatefulWidget {
  const HiredService({Key? key}) : super(key: key);

  @override
  State<HiredService> createState() => _HiredServiceState();
}

class _HiredServiceState extends State<HiredService> {

  Stream<QuerySnapshot> ref = firestore.collection("users").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height, width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Height(size: 40),
              
              BackButtonText(text: 'Hired Service Providers', size: 16, fontWeight: FontWeight.w500),

              Height(size: 20,),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: ref,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if (snapshot.hasError){
                      return Center(child: PoppinsText(text: "Something went wrong"));
                    }
                    else if (snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    final data = snapshot.requireData;
                    // var doc = snapshot.data?.docs[index].data();
                    return ListView.builder(
                        itemCount: data.size,
                        itemBuilder: (context, index){

                          if(data.docs[index]['accType'] == 'Service Provider' && data.docs[index]['hired'] == 'true')
                          {
                            return Column(
                              children: [

                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> ServiceDetails(
                                      uid: data.docs[index]['uid'],
                                    ));
                                  },
                                  child: ServiceProvider(
                                    name: data.docs[index]['name'],
                                    price: data.docs[index]['price'],
                                    location: data.docs[index]['location'],
                                    verified: data.docs[index]['verified'],
                                    profession: data.docs[index]['profession'],
                                    totime: data.docs[index]['totime'],
                                    fromtime: data.docs[index]['fromtime'],
                                    pic: data.docs[index]['profilePic'],
                                    available: data.docs[index]['available'],
                                  ),
                                ),
                                Height()
                              ],
                            );
                          }

                          return Container();
                        }
                    );
                  },
                ),
              )


            ],
          ),
        ),
      )



    );
  }


}



class ServiceProvider extends StatelessWidget {
  String? name; String? available; String? verified;
  String? fromtime; String? totime; String? pic;
  String? price; String? profession; String? location; VoidCallback? vertTap;
  ServiceProvider({Key? key,
    this.name,
    this.verified,
    this.profession,
    this.available,
    this.price,
    this.location,
    this.vertTap, this.pic,
    this.fromtime, this.totime
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [


          MyContainer(
            shadowColor: shadowcolor,
            radius: 20, horizontalPadding: 20,
            verticalPadding: 20, color: white,
            child: Column(
              children: [

                Row(
                  children: [

                    SpDp(
                      pic: pic!,
                      verified: verified!,
                      size: 60,
                    ),

                    Width(size: 10,),

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          PoppinsText(text: name!, size: 14, fontWeight: FontWeight.w500),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(text: '${profession}', color: orange, size: 10,),
                              PoppinsText(text: 'Ghc ${price}/hr', color: maincolor, fontWeight: FontWeight.w700)
                            ],
                          ),

                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(5, (index) =>
                                      Icon(Icons.star, size: 13.sp, color: star)
                                  )),
                              Width(),
                              PoppinsText(text: 'Reviews', size: 10, color: hinttext),
                            ],)

                        ],
                      ),
                    ),

                  ],
                ),


                Height(),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconText(icon: Icons.location_on, text: '${location}'),
                        Width(size: 10,),

                        available == 'Available'?
                        IconText(icon: Icons.check_circle, text: '${available}', color: active, iconColor: active,) :
                        IconText(icon: Icons.check_circle, text: '${available}', color: hinttext, iconColor: hinttext,),

                        Width(size: 10,),
                        IconText(icon: Icons.check_circle, text: 'Hired', iconColor: orange, color: orange,),
                      ],
                    ),

                    MyContainer(
                      color: shadowcolor, height: 35, width: 35,
                      radius: 50,
                      child: Icon(Icons.bookmark_border, color: maincolor,),
                    )

                  ],
                ),

                Height(size: 16,),
                
                Row(
                  children: [
                    PoppinsText(text: 'Scheduled', size: 14, fontWeight: FontWeight.bold,),
                    Width(),
                    PoppinsText(text: 'in progress', fontStyle: FontStyle.italic, color: maincolor)
                  ],
                ),

                Height(),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    MyContainer(
                      width: Get.width/3,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText(text: 'Date'),
                          PoppinsText(text: '08-07-2021', size: 14, fontWeight: FontWeight.w500,),
                          Height(),
                          PoppinsText(text: 'Start Time'),
                          PoppinsText(text: fromtime!, size: 14, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),

                    MyContainer(
                      width: Get.width/3,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText(text: 'Total Hours'),
                          PoppinsText(text: '02 Hours', size: 14, fontWeight: FontWeight.w500,),
                          Height(),
                          PoppinsText(text: 'End Time'),
                          PoppinsText(text: totime!, size: 14, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),

                  ]
                )

              ],
            ),
          ),

          Positioned(
            right: 5, top: 5,
            child: GestureDetector(
              onTap: vertTap,
              child: MyContainer(
                color: shadowcolor, height: 35, width: 35,
                radius: 50,
                child: Icon(Icons.more_vert),
              ),
            ),
          ),


        ]);
  }
}

class SpDp extends StatelessWidget {
  String? pic; String? verified; double size;
  SpDp({Key? key, this.verified, this.pic, this.size = 80}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return verified == 'true'?
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
                height: Get.height/(812/15), width: Get.height/(812/15),
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