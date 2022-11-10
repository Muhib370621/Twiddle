import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Screens/bottom_navi/service_screen/service_details.dart';
import '../../constants/constants.dart';

class AllServiceProviders extends StatelessWidget {
  final profession;
  AllServiceProviders({Key? key, this.profession}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
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

              if(data.docs[index]['accType'] == 'Service Provider') {

                return Column(
                  children: [

                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ServiceDetails(
                          uid: data.docs[index]['uid'],
                        ));
                      },
                      child: ServiceProviders(
                        name: data.docs[index]['name'],
                        profilePic: data.docs[index]['profilePic'],
                        profession: data.docs[index]['profession'],
                        price: data.docs[index]['price'],
                        location: data.docs[index]['location'],
                        verified: data.docs[index]['verified'],
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
    );
  }
}
class HiredServiceProviders extends StatelessWidget {
  const HiredServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
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

              if(data.docs[index]['accType'] == 'Service Provider') {
                if (data.docs[index]['hired'] == 'true') {
                  return Column(
                    children: [

                      GestureDetector(
                        onTap: () {
                          Get.to(() =>
                              ServiceDetails(
                                uid: data.docs[index]['uid'],
                              ));
                        },
                        child: ServiceProviders(
                          name: data.docs[index]['name'],
                          profilePic: data.docs[index]['profilePic'],
                          profession: data.docs[index]['profession'],
                          price: data.docs[index]['price'],
                          location: data.docs[index]['location'],
                          verified: data.docs[index]['verified'],
                          available: data.docs[index]['available'],
                        ),
                      ),
                      Height()
                    ],
                  );
                }
              }
              return Container();
            }
        );
      },
    );
  }
}
class VerifiedServiceProviders extends StatelessWidget {
  const VerifiedServiceProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> ref = FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
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

              if(data.docs[index]['accType'] == 'Service Provider'){
                if(data.docs[index]['verified'] == 'true') {
                  return Column(
                    children: [

                      GestureDetector(
                        onTap: (){
                          Get.to(()=> ServiceDetails(
                            uid: data.docs[index]['uid'],
                          ));
                        },
                        child: ServiceProviders(
                          name: data.docs[index]['name'],
                          profilePic: data.docs[index]['profilePic'],
                          profession: data.docs[index]['profession'],
                          price: data.docs[index]['price'],
                          location: data.docs[index]['location'],
                          verified: data.docs[index]['verified'],
                          available: data.docs[index]['available'],
                        ),
                      ),
                      Height()
                    ],
                  );
                }
              }
              return Container();
            }
        );
      },
    );
  }
}

class ServiceProviders extends StatelessWidget {
  String? name; String? available; String? verified;
  String? price; String? profession; String? profilePic; String? location; VoidCallback? vertTap;
  ServiceProviders({Key? key,
    this.name,
    this.verified,
    this.profession,
    this.available,
    this.price,
    this.profilePic,
    this.location,
    this.vertTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [


          MyContainer(
            shadowColor: shadowcolor,
            radius: 20, horizontalPadding: 20,
            verticalPadding: 20,color: white,
            child: Column(
              children: [

                Row(
                  children: [

                    verified == 'true'?
                    Stack(
                      children: [

                        Container(
                          height: Get.height/(812/60), width: Get.height/(812/60),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(profilePic!)
                              )
                          ),


                        ),
                        Positioned(
                            right: 1, top: 1, height: Get.height/50, width: Get.height/50,
                            child: Image.asset('assets/verified.png'))
                      ],
                    ) : Container(
                        height: Get.height/(812/60), width: Get.height/(812/60),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(profilePic!)
                            )
                        )
                    ),

                    Width(size: 10,),

                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          PoppinsText(text: '${name}', size: 14, fontWeight: FontWeight.w500),

                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PoppinsText(text: '${profession}', color: orange, size: 10,),
                              PoppinsText(text: 'Ghc ${price}/hr', color: maincolor, fontWeight: FontWeight.w500)
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
                        IconText(icon: Icons.check_circle, text: '${available}', color: hinttext, iconColor: hinttext,)
                      ],
                    ),

                    MyContainer(
                      color: shadowcolor, height: 35, width: 35,
                      radius: 50,
                      child: Icon(Icons.bookmark_border, color: maincolor,),
                    )

                  ],
                ),


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