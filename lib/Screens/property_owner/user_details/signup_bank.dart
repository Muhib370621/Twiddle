import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../Utilities/comp_screen.dart';
import '../../../constants/constants.dart';
import '../../user_auth/signUpController.dart';
import 'main_page.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {

  final bankName =   TextEditingController();
  final branchName =   TextEditingController();
  final accountNo =  TextEditingController();
  final accName =    TextEditingController();
  final mobileNumber =     TextEditingController();
  final nameMobile = TextEditingController();
  final control = SignUpController();

  // Future addBankDetails() async {
  //
  //   try{
  //
  //     FirebaseFirestore owner = FirebaseFirestore.instance;
  //     owner.collection("BankDetails").add({
  //
  //       "BankName": bankName.text,
  //       "BranchName": branchName.text,
  //       "AccName": accName.text,
  //       "AccNumber": accountNo.text,
  //       "PhoneNo": mobileNumber.text,
  //       "WalletName": nameMobile.text,
  //     });
  //
  //     Fluttertoast.showToast(
  //         msg: "Next Process",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Color(0xFF1E272E),
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainPageOwner()));
  //
  //   }on FirebaseAuthException  catch(e){
  //     Fluttertoast.showToast(
  //         msg: e.toString(),
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.SNACKBAR,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Color(0xFF1E272E),
  //         textColor: Colors.white,
  //         fontSize: 16.0
  //     );
  //   }
  //
  //
  // }

  Future addBankDetails() async{

    final ref = FirebaseDatabase.instance.ref();
    final key = ref.child("BankDetails").push().key;

    try{
      ref.child("BankDetails").push().set({
        "BankName": bankName.text,
        "BranchName": branchName.text,
        "AccName": accName.text,
        "AccNumber": accountNo.text,
        "PhoneNo": mobileNumber.text,
        "WalletName": nameMobile.text,
      });

      Fluttertoast.showToast(
          msg: "Next Process",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );

      Get.to(MainPageOwner());
    }catch(e){
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xFF1E272E),
          textColor: Colors.white,
          fontSize: 16.0
      );
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
                width: Get.width,
                height: Get.height * 0.3,
                child: Container(
                    width: Get.width,
                    height: 32,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/reg.png"))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            width: Get.width*0.08,
                            height: Get.height*0.05,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black, size: 20,),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))

            ),
          ),
          Positioned.fill(
            top: Get.height * 0.22,
            child: Container(
              height: Get.height * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 25),
                      Text("Create new account", style: kLargeTextStyle),

                      SizedBox(height: 3),
                      PoppinsText(text: 'Respond to the following and proceed.', color: hinttext),

                      SizedBox(height: 20),
                      Text("BANK DETAILS",style: TextStyle(color: Color(0xff0336FF),fontSize: 20,fontWeight: FontWeight.bold)),

                      SizedBox(height: 20),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "BANK NAME",
                        hintText: "Bank Of Ghana",
                        controller: bankName,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "BRANCH NAME",
                        hintText: "Awulen Kodjo Street",
                        controller: branchName,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "ACCOUNT NUMBER",
                        hintText: "897313301028584",
                        controller: accountNo,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "ACCOUNT NAME",
                        hintText: "Margaret Novakowska",
                        controller: accName,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 20),
                      Text("MOBILE MONEY DETAILS",style: TextStyle(color: Color(0xff0336FF),fontSize: 20,fontWeight: FontWeight.bold)),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "MOBILE MONEY NUMBER",
                        hintText: "+233302513314",
                        controller: mobileNumber,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 15),
                      CustomEditedFiled(
                        width: Get.width,
                        height: Get.height*0.075,
                        text: "NAME ON MOBILE MONEY WALLET",
                        hintText: "Vodafone",
                        controller: nameMobile,
                        hintTextColor: kCreateAccountHintColor,
                      ),

                      SizedBox(height: 30),
                      CustomBlueButton(
                        width: Get.width,
                        height: Get.height*0.075,
                        fontSize: 15,
                        text: "Finish",
                        onPressed: () {
                          if(bankName.text.isEmpty||branchName.text.isEmpty||accountNo.text.isEmpty||accName.text.isEmpty||mobileNumber.text.isEmpty||nameMobile.text.isEmpty){
                            Fluttertoast.showToast(
                                msg: "Enter All Fields ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.SNACKBAR,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Color(0xFF1E272E),
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          }else{
                            addBankDetails();

                          }




                          //Get.to(()=>NaviOwnerPro());
                          // if(fName.text.isEmpty||userName.text.isEmpty||mobile.text.isEmpty||email.text.isEmpty||password.text.isEmpty){
                          //   Fluttertoast.showToast(
                          //       msg: "Enter All Fields ",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.SNACKBAR,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Color(0xFF1E272E),
                          //       textColor: Colors.white,
                          //       fontSize: 16.0
                          //   );
                          //   print("enter");
                          //
                          // }else if(!email.text.contains('@')||!email.text.contains('.com')){
                          //   Fluttertoast.showToast(
                          //       msg: "Invalid Email",
                          //       toastLength: Toast.LENGTH_SHORT,
                          //       gravity: ToastGravity.SNACKBAR,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: Color(0xFF1E272E),
                          //       textColor: Colors.white,
                          //       fontSize: 16.0
                          //   );
                          // }else{
                          //   signUp();
                          // }
                          // Get.to(()=>CreateAccount_2());
                        },
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

