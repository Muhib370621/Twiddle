import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:state_agent/Api_Services/user/login_controller.dart';
import 'package:state_agent/bottom_navigation/chat_screen/send_message.dart';
import 'package:state_agent/constants/constants.dart';

import '../../constants/methods.dart';
import 'messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final ref = FirebaseDatabase.instance.ref().child('chatroom');
  Stream<QuerySnapshot> info = FirebaseFirestore.instance.collection("users").snapshots();
  var roomId, receiverId, senderId, uid, status;
  int msgs = 1;

  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {

    bool isHover = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height, width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              authUser['accType'] == 'Property Owner' || authUser['accType'] == 'FSP'|| LoginController.User['type'] == 'Real Estate'?
              MyContainer(
                horizontalPadding: 20,
                color: maincolor,
                height: 127,
                child: Row(
                  children: [

                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back_ios, color: white,)
                    ),

                    Expanded(
                      child: MyTextField(
                        hint: 'Search Messages…',
                        radius: 30, color: white,
                        suffixIcon: Icons.search,
                        onSuffixIconTap: (){
                          searchUser(search.text);
                        },
                      ),
                    ),
                  ],
                ),
              ) : MyContainer(
                color: maincolor, horizontalPadding: 20,
                height: 127,
                child: Center(
                  child: MyTextField(
                    controller: search,
                    hint: 'Search Messages…',
                    radius: 30, color: white,
                    suffixIcon: Icons.search,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Height(size: 25),

                    PoppinsText(text: 'Messages', size: 28, fontWeight: FontWeight.bold,),
                    PoppinsText(text: 'You have 5 new messages', size: 14, color: hinttext),

                    Height(size: 25),
                  ],
                ),
              ),

              MyContainer(
                height: 120, borderColor: lightButton,
                child: Center(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: info,
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
                        scrollDirection: Axis.horizontal,
                          itemCount: data.size,
                          itemBuilder: (context, index){

                            var doc = snapshot.data?.docs[index].data();
                            uid = data.docs[index]['uid'];
                            status = data.docs[index]['status'];

                            if(uid == auth.currentUser?.uid) {
                              return Container();
                            }

                            return Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=> ChatRoom(
                                      receiverId: data.docs[index]['uid'],
                                    ));
                                  },
                                  child: Dp(
                                    pic: data.docs[index]['profilePic'],
                                    status: data.docs[index]['status'],
                                    name: data.docs[index]['name'],
                                    type: data.docs[index]['accType'],
                                  ),
                                ),
                                Width(size: 15),

                              ],
                            );
                          }
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: info,
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
                          uid = data.docs[index]['uid'];
                          status = data.docs[index]['status'];

                          if(uid == auth.currentUser?.uid) {
                            return Container();
                          }

                          return Column(
                            children: [

                              MyDivider(color: lightButton),

                              GestureDetector(
                                onTap: (){
                                  Get.to(()=> ChatRoom(
                                    receiverId: data.docs[index]['uid'],
                                  ));
                                },
                                child: Chat(
                                  name: data.docs[index]["name"],
                                  imageUrl: data.docs[index]["profilePic"],
                                  timestamp: '07:00 pm'//data.docs[index]["status"],
                                ),
                              ),
                            ],
                          );
                        }
                    );
                  },
                ),
              ),

              authUser['accType'] == 'Property Owner' || authUser['accType'] == 'FSP'|| LoginController.User['type'] == 'Real Estate'
                  ? Height(size: 0) : Height(size: 65)



              // Expanded(
              //   child: FirebaseAnimatedList(
              //     query: ref,
              //     itemBuilder: (BuildContext context, DataSnapshot snapshot,
              //         Animation<double> animaiton, int index){
              //       var value = Map<String, dynamic>.from(snapshot.value as Map);
              //
              //       senderId = value['senderId'];
              //       receiverId = value['receiverId'];
              //       roomId = value['roomId'];
              //
              //       if(senderId == auth.currentUser?.uid || receiverId == auth.currentUser?.uid){
              //
              //
              //           if(senderId == auth.currentUser?.uid){
              //             return GestureDetector(
              //               onTap: () => Get.to(()=> ChatRoom(
              //                 receiverId: value['receiverId'],
              //                 roomId: value['roomId'],
              //                 message: value['message'],
              //                 name: value['receiverName'],
              //               )),
              //               child: Chat(
              //                 name: value['receiverName'],
              //                 message: value['message'],
              //                 timestamp: value['time'],
              //               ),
              //             );
              //           }
              //
              //           else if(receiverId == auth.currentUser?.uid){
              //             return GestureDetector(
              //               onTap: () => Get.to(()=> ChatRoom(
              //                 receiverId: value['senderId'],
              //                 roomId: value['roomId'],
              //                 message: value['message'],
              //                 name: value['senderName'],
              //               )),
              //               child: Chat(
              //                 name: value['senderName'],
              //                 message: value['message'],
              //                 timestamp: value['time'],
              //
              //               ),
              //             );
              //           }
              //
              //       }
              //
              //       return Container();
              //
              //       msgs = msgs++;
              //
              //     },
              //
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  String name; String message; final onDismissed;
  String timestamp; String? imageUrl;
  Chat({Key? key,
    this.name = 'Name', this.timestamp = 'Now', this.onDismissed,
    this.message = 'This is Message', this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: active),
      secondaryBackground: Container(color: Colors.red),
      key: UniqueKey(),
      child: MyContainer(
        horizontalPadding: 20, verticalPadding: 10,
        child: Row(
          children: [
            Dp(
              pic: imageUrl,
            ),
            Width(size: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText(text: name, fontWeight: FontWeight.w500, size: 14),
                      PoppinsText(text: timestamp, color: hinttext,),
                    ],
                  ),

                  PoppinsText(text: message, color: hinttext, maxLines: 1, overflow: TextOverflow.ellipsis)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Dp extends StatelessWidget {
  String? pic; String? status; String? name; String? type;
  Dp({Key? key, this.pic, this.name, this.status, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return status == 'online'?
    Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [

              Container(
                height: Get.height/(812/60), width: Get.height/(812/60),
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
                right: 0, bottom: 0,
                child: MyContainer(
                  height: 17, width: 17,
                  radius: 10, borderColor: white,
                  color: active, borderWidth: 3,
                ),
              )

            ],
          ),

          name != null?
          PoppinsText(text: name!, size: 10, fontWeight: FontWeight.w500, textAlign: TextAlign.center):Container(),
          status != null?
          PoppinsText(text: type!, size: 10, color: maincolor, textAlign: TextAlign.center):Container()
        ],
      ),
    ) : Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: Get.height/(812/60), width:Get.height/(812/60),
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

          name != null?
          PoppinsText(text: name!, size: 10, fontWeight: FontWeight.w500, textAlign: TextAlign.center):Container(),
          status != null?
          PoppinsText(text: type!, size: 10, color: maincolor, textAlign: TextAlign.center):Container()

        ],
      ),
    );
  }
}
