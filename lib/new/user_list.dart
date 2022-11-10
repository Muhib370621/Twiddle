import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';


class UserList extends StatefulWidget {

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message){
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if(notification != null && android != null){
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           NotificationDetails(
  //             android: AndroidNotificationDetails(
  //                 channel.id,
  //                 channel.name,
  //                 color: maincolor,
  //                 playSound: true,
  //                 icon: '@assets/logo.svg'),
  //           )
  //       );
  //     }
  //
  //   });
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
  //     print('A new onMessageOpenedApp event was published');
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if(notification != null && android != null){
  //       showDialog(
  //           context: context,
  //           builder: (_){
  //             return  AlertDialog(
  //               title: Text("notification.title"),
  //               content: SingleChildScrollView(
  //                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text("notification.body")
  //                   ],
  //                 ),
  //               ),
  //             );
  //           });
  //     }
  //   });
  // }
  //
  // void showNotification(){
  //   flutterLocalNotificationsPlugin.show(
  //       1,
  //       "Testing",
  //       "How r u",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             color: maincolor,
  //             playSound: true,
  //             icon: '@assets/logo.svg',
  //           )
  //       )
  //   );
  // }


  final user = FirebaseAuth.instance.currentUser;
  signoutUser() async{

    try{
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.signOut();

      Get.snackbar("Signout successfully", "", snackPosition: SnackPosition.BOTTOM);

    }catch (e){
      Get.snackbar("Error", "$e", snackPosition: SnackPosition.BOTTOM);
    }
  }

  Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection("UserData").snapshots();
  Stream<QuerySnapshot> status = FirebaseFirestore.instance.collection("Status").snapshots();
  bool value = false;

  deleteData() async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("info");

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            // color: Colors.white,
            width: double.infinity,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Height(size: 50),
                PoppinsText(text: "User List", size: 30, fontWeight: FontWeight.w500),
                Height(size: 20),


                Container(
                  height: Get.height/1.5, width: Get.width,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: shadowcolor,
                            offset: Offset(2, 7)
                        )
                      ]
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if (snapshot.hasError){
                        return Text("Something went wrong");
                      }
                      else if (snapshot.connectionState == ConnectionState.waiting){
                        return Center(
                            child: CircularProgressIndicator(
                              color: maincolor,
                            )
                            //poppinsText(text: "Loading...")
                        );
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(

                          itemCount: data.size,
                          itemBuilder: (context, index){
                            var doc = snapshot.data?.docs[index].data();
                            return

                            //   value == true ?
                            //
                            // Card(
                            //   child: ListTile(
                            //     title: Text(data.docs[index]["UserName"],
                            //         style: TextStyle(fontSize: 18.sp)),
                            //     subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Text(data.docs[index]["EmailAddress"],
                            //             style: TextStyle(fontSize: 14.sp)),
                            //         Text(data.docs[index]["UserStatus"],
                            //             style: TextStyle(fontSize: 12.sp)),
                            //       ],),
                            //     trailing: InkWell(
                            //         onTap: (){},
                            //         child: Icon(Icons.add)),
                            //     leading: ClipRRect(
                            //         borderRadius: BorderRadius.circular(100.r),
                            //         child: Image.asset("assets/admin.png", fit: BoxFit.cover)),
                            //   ),
                            // ) :

                              Profile(
                                name: data.docs[index]["UserName"],
                                email: data.docs[index]["EmailAddress"],
                                status: data.docs[index]["UserStatus"]
                            );
                          }

                      );
                    },
                  ),
                ),

                Height(size: 20,),

                Button(
                  onTap: (){
                    //showNotification();
                  },
                  text: "Notification", size: 18, fontWeight: FontWeight.w500
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  String name;
  String email;
  String status;

  Profile({
    Key? key,
    required this.name,
    required this.email,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.only(bottom: 10.h),
      height: 100, width: double.infinity,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: shadowcolor,
                offset: Offset(2, 7)
            )
          ]
      ),

      child: Column(
        children: [

          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),

              Width(),

              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      PoppinsText(text: name.toUpperCase(), size: 14,),
                      Width(),
                      PoppinsText(text: email, color: silver)
                    ],
                  ),

                  PoppinsText(text: status, color: silver)
                ],
              )

            ],
          ),

          Align(
              alignment: Alignment.bottomRight,
              child: PoppinsText(text: ""))

        ],
      ),

    );
  }
}

class userCard extends StatelessWidget {
  String name;
  String email;
  String gender;

  userCard({
  Key? key,
  required this.name,
  required this.email,
  required this.gender,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name,//data.docs[index]["name"],
            style: TextStyle(fontSize: 18.sp)),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(email,//data.docs[index]["email"],
                style: TextStyle(fontSize: 14.sp)),
            Text(gender,//data.docs[index]["gender"],
                style: TextStyle(fontSize: 12.sp)),
          ],),
        trailing: InkWell(
            onTap: (){},
            child: Icon(Icons.add)),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Image.asset("assets/admin.png", fit: BoxFit.cover)),
      ),
    );
  }
}
