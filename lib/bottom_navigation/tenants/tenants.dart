import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/bottom_navigation/tenants/tenant_profile.dart';

import '../../constants/constants.dart';
import '../../constants/methods.dart';
import '../chat_screen/messages.dart';

class Tenants extends StatelessWidget {
  Tenants({Key? key}) : super(key: key);

  Stream<QuerySnapshot> ref = firestore.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
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

              var doc = snapshot.data?.docs[index].data();

              return Column(
                children: [
                  Height(),
                  Tenant(
                    name: data.docs[index]['name'],
                    uid: data.docs[index]['uid'],
                    photoUrl: data.docs[index]['profilePic'],
                    phone: data.docs[index]['contact'],
                    email: data.docs[index]['email'],
                  ),
                ],
              );
            }
        );
      },
    );
  }
}

class Tenant extends StatelessWidget {
  String? name; String? phone; String? email; String? photoUrl;
  double rentPaid; double remainingRent; String? uid;
  Tenant({Key? key,
    this.photoUrl, this.email, this.name, this.phone, this.remainingRent = 0,
    this.rentPaid = 0, this.uid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> TenantProfile(
          uid: uid,
          photoUrl: photoUrl,
          name: name,
          email: email,
          phone: phone,
        ));
      },
      child: Container(
        height: Get.height/11.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            gradient: LinearGradient(
                colors: [
                  Color(0xff8700FF),
                  Color(0xffE600FF)
                ])
        ),
        child: Center(
          child: ListTile(
            leading: Container(
              height: Get.height/(812/40), width: Get.height/(812/40),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: photoUrl != null? DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(photoUrl!)
                  ) : DecorationImage(
                      image: AssetImage('assets/adm.png')
                  )
              ),
            ),

            title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PoppinsText(text: name!, color: white, size: 14, fontWeight: FontWeight.w500,),

                GestureDetector(
                  onTap: (){
                    Get.to(()=> ChatRoom(
                      receiverId: uid!,
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: white
                    ),
                    child: PoppinsText(text: 'Contact', size: 10, fontWeight: FontWeight.w500,),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}