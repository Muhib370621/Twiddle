import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:state_agent/bottom_navigation/chat_screen/send_message.dart';
import 'package:state_agent/constants/image_picker.dart';

import '../../constants/constants.dart';
import '../../constants/methods.dart';


class ChatRoom extends StatefulWidget {
  String roomId; String receiverId;
  ChatRoom({Key? key, this.roomId = '', this.receiverId = ''}) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}


class _ChatRoomState extends State<ChatRoom> {

  var senderId, receiverId, time, receiver, checkRoomId, roomId;

  @override
  void initState() {
    getReceiverData();
    super.initState();
  }

  getReceiverData() async{
    QuerySnapshot receiverSnap = await firestore.collection('users').where('uid', isEqualTo: widget.receiverId).get();
    setState(() {
      receiver = receiverSnap.docs[0].data();

      roomId = '${widget.receiverId}_${auth.currentUser?.uid}';
    });
  }

  final ref = FirebaseDatabase.instance.ref('chatroom');

  final message = TextEditingController();


  getTime() async{
    setState(() {
      time = DateFormat('KK:mm a').format(DateTime.now());
    });
  }


  @override
  Widget build(BuildContext context) {
    if(receiver == null){
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
      body: Container(
        color: Colors.white,
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [

            MyContainer(
              color: maincolor,
              height: 115,
              child: Row(
                children: [
                  MyBackButton(size: 20, onTap: ()=> Get.back()),
                  Width(size: 10),

                  Container(
                    height: Get.height/(812/50), width: Get.height/(812/50),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(receiver['profilePic'])
                        )
                    ),
                  ),
                  Width(size: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PoppinsText(
                          text: receiver['name'],
                          size: 14, fontWeight: FontWeight.w600,
                          color: white
                      ),
                      PoppinsText(
                          text: receiver['status'],
                          color: lightButton
                      ),
                    ],
                  )
                ],
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animaiton, int index){
                    var value = Map<String, dynamic>.from(snapshot.value as Map);

                    senderId = value['senderId'];
                    receiverId = value['receiverId'];
                    checkRoomId = value['roomId'];

                    if(checkRoomId == '${receiver['uid']}_${auth.currentUser?.uid}' || checkRoomId == '${auth.currentUser?.uid}_${receiver['uid']}'){
                      if(receiverId == widget.receiverId  || senderId == widget.receiverId){

                        if(senderId == auth.currentUser?.uid){
                          return Column(
                            children: [

                              Height(size: 10),
                              CurrentUserMessges(
                                message: value['message'],
                                time: value['time'],
                              ),
                            ],
                          );
                        }
                        else if(receiverId == widget.receiverId || senderId == widget.receiverId){
                          return Column(

                            children: [
                              Height(size: 10),
                              UserMessges(
                                message: value['message'],
                                time: value['time'],
                              ),
                            ],
                          );
                        }
                      }
                    }

                    return Container();
                  }
                ),
              ),
            ),



            MyContainer(
              shadowColor: silver,
              height: 94, color: white,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ()=> uploadUniImage(),
                    child: Icon(Icons.attach_file, size: 30.sp)
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: MyTextField(
                        onSuffixIconTap: (){

                          if(message.text.isNotEmpty){

                            getTime();
                            sendMessage(message.text, widget.receiverId, widget.roomId, time);
                            message.clear();
                          }
                          print(roomId);

                        },
                        controller: message,
                        color: shadowcolor,
                        suffixIcon: Icons.send, suffixIconColor: maincolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class CurrentUserMessges extends StatelessWidget {
  String? message; var time;
  CurrentUserMessges({Key? key,
    this.message, this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [

          Container(
            width: Get.width*0.7,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.r),
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                )
            ),
            child: PoppinsText(text: '${message}', color: white),
          ),

          PoppinsText(text: '${time}', color: hinttext)

        ],
      ),
    );
  }
}

class UserMessges extends StatelessWidget {
  String? message; String? time;
  UserMessges({Key? key,
    this.message, this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: Get.height/27,
                height: Get.height/27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/pic1.png'),
              ),
              SizedBox(width: 10),
              Container(
                width: Get.width*0.7,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    color: Color(0xffEAECF2),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.r),
                      topLeft: Radius.circular(10.r),
                      bottomRight: Radius.circular(10.r),
                    )
                ),
                child: PoppinsText(text: '${message}'),
              ),
            ],
          ),

          Row(
            children: [
              Container(
                width: Get.height/27,
              ),
              SizedBox(width: 10),
              PoppinsText(text: '${time}', color: hinttext)
            ],
          )

        ],
      );
  }
}

class Dp extends StatelessWidget {
  String? pic; double size;
  Dp({Key? key, this.pic, this.size = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}


// Row(
//   children: [
//     Container(
//       width: Get.width*0.12,
//       height: Get.height*0.12,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//               image: AssetImage("assets/debra.png")
//           )
//       ),
//     ),
//     SizedBox(width: 10),
//     Column(crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           width: Get.width*0.7,
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//           decoration: BoxDecoration(
//               color: Color(0xffEAECF2),
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10.r),
//                 topLeft: Radius.circular(10.r),
//                 bottomRight: Radius.circular(10.r),
//               )
//           ),
//           child: PoppinsText(text: "Hi Cassie! Would you be available for a coffee next week? 😁"),
//         ),
//         PoppinsText(text: "9:00", color: hinttext)
//       ],
//     ),
//   ],
// ),
// Row(mainAxisAlignment: MainAxisAlignment.end,
//   children: [
//
//     Column(crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Container(
//           width: Get.width*0.7,
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//           decoration: BoxDecoration(
//               color: Color(0xff0336FF),
//               borderRadius: BorderRadius.only(
//                 topRight: Radius.circular(10.r),
//                 topLeft: Radius.circular(10.r),
//                 bottomLeft: Radius.circular(10.r),
//               )
//           ),
//           child: PoppinsText(text: "Lorem ipsum dolor sit amet, consetetur sadipscing Elitr. Lorem ipsum dolor sit amet, consetetur sadipscing Elitr 😁",
//           color: white),
//         ),
//         PoppinsText(text: "9:00", color: hinttext)
//       ],
//     ),
//     SizedBox(width: 10,),
//
//     Container(
//       width: Get.width*0.12,
//       height: Get.height*0.12,
//       decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           image: DecorationImage(
//               image: AssetImage("assets/johan.png")
//           )
//       ),
//     ),
//   ],
// ),