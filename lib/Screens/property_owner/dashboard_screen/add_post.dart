import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:state_agent/constants/constants.dart';

import '../../../property/addproperty.dart';


class AddPostScreen extends StatefulWidget {
  String? title;
  int price;
  String? desc;
  String? type;
  String? bedroom;
  String? washroom;
  String? parking;
  String? kitchen;
  int floorArea;
  bool? tap;
  bool? ac;
  bool? quarters;

  AddPostScreen({Key? key,
    this.title, this.desc, this.washroom, this.parking, this.kitchen,
    this.floorArea = 0, this.tap, this.ac, this.quarters, this.bedroom,
    this.price = 0, this.type
  }) : super(key: key);
  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  bool value1 = false;
  bool value2 = false;
  final houseNo = TextEditingController();
  final streetName = TextEditingController();
  final gpsAddress = TextEditingController();
  final occupationName = TextEditingController();
  final occupationContact = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Height(size: 40),
              BackButtonText(text: 'Ad Post', size: 20, fontWeight: FontWeight.bold),

              Height(size: 20),
              PoppinsText(text: "Upload Cover Image", size: 14),
              Height(size: 10),
              PoppinsText(text: 'Type: jpg and png. Dimensions 333px x 163px - 999px x 489px', size: 10, fontWeight: FontWeight.w500),

              Height(size: 15),

              MyContainer(
                height: 80, width: 80, radius: 10, borderColor: black,
                child: Icon(Icons.photo_camera_outlined, size: 30),
              ),

              Height(),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),



              Height(size: 20),
              PoppinsText(text: 'Upload Upto 6 Photos', size: 14),



              Height(),
              PoppinsText(text: 'Type: jpg and png.', size: 10),

              Height(),
              Row(
                children: List.generate(3, (index) =>
                Row(children: [
                  MyContainer(
                    height: 80, width: 80, radius: 10, borderColor: black,
                    child: Icon(Icons.add_a_photo_outlined, size: 30),
                  ),
                  Width(size: 15),
                ],))
              ),
              Height(),
              Row(
                  children: List.generate(3, (index) =>
                      Row(children: [
                        MyContainer(
                          height: 80, width: 80, radius: 10, borderColor: black,
                          child: Icon(Icons.add_a_photo_outlined, size: 30),
                        ),
                        Width(size: 15),
                      ],))
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),


              Height(size: 20),
              PoppinsText(text: 'Upload Upto One 360 View Image', size: 14),

              Height(size: 15,),
              MyContainer(
                height: 80, width: 80, radius: 10, borderColor: black,
                  child: Center(child: MyContainer(child: Image.asset("assets/view.png"), width: 40, height: 40)),
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 2mb.', color: redtext, size: 10),


              Height(size: 20),
              PoppinsText(text: 'Upload Upto One Video', size: 14),

              Height(size: 15,),
              MyContainer(
                height: 80, width: 80, radius: 10, borderColor: black,
                child: Icon(Icons.video_call_outlined, size: 30),
              ),
              Height(size: 15),
              PoppinsText(text: 'Maximum size 10mb.', color: redtext, size: 10),
              PoppinsText(text: 'For the cover picture we recommend using the landscape mode.', size: 10),

              Height(size: 18,),
              PoppinsText(text: 'PROPERTY DETAILS FORM', size: 16, fontWeight: FontWeight.w500, color: maincolor),

              Height(),
              PoppinsText(text: 'House Number'),
              Height(),
              MyTextField(
                  height: 50, borderColor: black,
                  hint: '', color: white, radius: 5,
                  controller: houseNo,
              ),
              Height(size: 15),

              PoppinsText(text: 'Street Name'),
              Height(),
              MyTextField(
                height: 50, borderColor: black,
                hint: '', color: white, radius: 5,
                controller: streetName,
              ),
              Height(size: 15),

              PoppinsText(text: 'GPS Address'),
              Height(),
              MyTextField(
                height: 50, borderColor: black,
                hint: '', color: white, radius: 10,
                controller: gpsAddress,
              ),
              Height(size: 15),

              PoppinsText(text: "Location of property identified through Google Map",color: hinttext, size: 10,),
              Height(size: 15),

              PoppinsText(text: " PROPERTY DOCUMENTATION COPY", fontWeight: FontWeight.w500),
              Height(),


              Iconbutton(
                width: 120, height: 40, icon: Icons.add_a_photo,
                text: 'Upload', buttonColor: Color(0xff1492E6), radius: 10,
              ),
              Height(),

              PoppinsText(text: 'Property Documentation Copy Upload Pdf Or Image* E.G. Copy Of Site Plan, Photo Of House Number Label, Bank Statement Or A Utility Bill, That Bears The Name Of Property Owner, Etc.', size: 10, color: hinttext),
              Height(size: 15,),


              PoppinsText(text: 'Current Occupant\'s Name'),
              Height(),
              MyTextField(
                height: 50, borderColor: black,
                hint: '', color: white, radius: 10,
                controller: occupationName,
              ),
              SizedBox(height: 15),

              Height(size: 15,),


              PoppinsText(text: 'Current Occupant\'s Contact'),
              Height(),
              MyTextField(
                height: 50, borderColor: black,
                hint: '', color: white, radius: 10,
                controller: occupationContact,
              ),
              Height(size: 15,),
              Row(
                children: [
                  Checkbox(
                  value: value1,
                  onChanged: (value) {
                    setState(() {
                      value1 = !value1;
                    });
                  },
                ),
                  SizedBox(width: 3),
                  PoppinsText(text: "Letter Of Consent Agreement", decoration: TextDecoration.underline),
                ]
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Checkbox(
                  value: value2,
                  onChanged: (value) {
                    setState(() {
                      value2 = !value2;
                    });
                  },
                ),
                    Width(),
                    Expanded(
                        child: PoppinsText(text: 'Must Agree To A 4% Mediation Fees To Twiddle Through Funders.')
                    )
              ]),

              Height(size: 40),
              Button(
                 height: 50,
                 text: "Post",
                 onTap: (){

                   if(houseNo.text.isNotEmpty && streetName.text.isNotEmpty && gpsAddress.text.isNotEmpty &&
                       occupationName.text.isNotEmpty && occupationContact.text.isNotEmpty)
                   {
                     if(value1 == true && value2 == true){

                       addProperty('${widget.title}',
                           widget.desc,
                           widget.bedroom,
                           widget.washroom,
                           widget.parking,
                           widget.kitchen,
                           widget.tap,
                           widget.ac,
                           widget.quarters,
                           widget.type,
                           houseNo.text,
                           occupationName.text,
                           occupationContact.text.trim(),
                           streetName.text,
                           gpsAddress.text,
                           widget.price,
                           widget.floorArea
                       );

                     }
                     else {
                       Fluttertoast.showToast(msg: 'Accept terms & policies');
                     }

                   }

                   else{
                     Fluttertoast.showToast(msg: 'Enter all fields');
                   }

                 }
                 ),

              Height(size: 30)


            ],
          ),
        ),
      ),
    );
  }
}

Widget MyIconContainer (IconData icon, double size){
  return     Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        border: Border.all(color: Color(0xff707070),width: 1),
        borderRadius: BorderRadius.circular(13)
    ),
    child: Icon(icon, size: size),
  );
}