import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';


class EnterAmount extends StatefulWidget {
  const EnterAmount({Key? key}) : super(key: key);

  @override
  State<EnterAmount> createState() => _EnterAmountState();
}

class _EnterAmountState extends State<EnterAmount> {
  final enterAmount=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                RoundBackButton(),
                SizedBox(width: 10),
                Text("TOP-UP TWIDDLE WALLET",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 50),

            Center(
              child: Container(
                width: Get.width*0.8,
                height: Get.height*0.1,
                padding: EdgeInsets.only(left: 20,right: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color(0xffF2F6FE),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text("GHC",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),

                    SizedBox(width: 30),
                    Container(width: 1,height: Get.height*0.06,color: Color(0xff0336FF)),
                    SizedBox(width: 80),
                    Expanded(
                      child: TextField(
                        controller: enterAmount,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 15),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "5000",
                          hintStyle: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                      ),
                    ),




                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text("Min. 3000GHC",style: TextStyle(color: Color(0xffFF7474),fontSize: 12)),
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCancelButton(
                  width: Get.width*0.4,
                  height: Get.height*0.070,
                  fontSize: 15,
                  text: "Cancel",
                  onPressed: () {
                    Get.back();
                  },

                  color: Colors.black,
                ),
                SizedBox(width: 20),
                CustomBlueButton(
                    width: Get.width*0.4,
                    height: Get.height*0.070,
                    fontSize: 15,
                    text: "Continue",
                  onPressed: () {
                      showAlertDialog(context);
                  },

                ),


            ]),
            SizedBox(height: 30),



          ],
        ),
      ),
    );
  }


  showAlertDialog(BuildContext context) {

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(10),
      actionsPadding: EdgeInsets.only(left: 30,right: 30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      actions:<Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset("assets/done.png",width: 80,height: 80),
            SizedBox(height: 20),
            Text("Hurrah!",style: TextStyle(color: Color(0xff1E32FA),fontSize: 14)),
            SizedBox(height: 5),
            Text("5000GHC Added In Your\n Twiddle Wallet",textAlign: TextAlign.center,style: TextStyle(color: Color(0xff01E08F),fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 30),

            CustomBlueButton(
              width: Get.width*0.6,
              height: Get.height*0.070,
              fontSize: 15,
              text: "Done",
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },

            ),
            SizedBox(height: 20),
          ],
        ),

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }


}
