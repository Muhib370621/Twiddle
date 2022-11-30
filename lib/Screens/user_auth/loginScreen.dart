import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_agent/Screens/user_auth/components/inputTextField.dart';
import 'package:state_agent/Screens/user_auth/components/panelButtons.dart';
import 'package:state_agent/Screens/user_auth/loginController.dart';
import 'package:state_agent/Screens/user_auth/signUpController.dart';
import 'package:state_agent/constants/methods.dart';
import '../../Api_Services/user/login_controller.dart';
import '../../Utilities/comp_screen.dart';
import '../../constants/appColors.dart';
import '../../constants/constants.dart';
import 'CreateAccount/createAcount.dart';
import 'ForgotPassword/forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: BG(
          // type: type,
          child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Height(size: 30),
              PoppinsText(
                text: 'Login As Real Estate',
                size: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.mainColor,
              ),

              // Height(size: 5),
              //
              // PoppinsText(text: 'Enter your email or number', fontWeight: FontWeight.w500, color: hinttext),

              Height(size: 25),
              // Height(),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   height: Get.height / (812 / 45),
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: grey),
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(6),
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton(
              //       icon: Icon(
              //         Icons.keyboard_arrow_down,
              //         color: maincolor,
              //       ),
              //       isExpanded: true,
              //       items: types
              //           .map((value) => DropdownMenuItem(
              //                 child: PoppinsText(
              //                     text: value, fontWeight: FontWeight.w500),
              //                 value: value,
              //               ))
              //           .toList(),
              //       onChanged: (val) {
              //         setState(() {
              //           type = val as String?;
              //         });
              //       },
              //       value: type,
              //       hint: PoppinsText(
              //           text: "Account Type", fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),

              // TypeDropdown()
              // Height(size: 15),
              // SizedBox(height: 2.h),
              Text(
                "EMAIL",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "PoppinsBold",
                ),
              ),
              SizedBox(height: 9.h),
              InputTextField(
                hintText: "example@gmail.com",
                prefixVisibility: false,
                fieldController: loginController.emailController.value,
                obscurance: false,
                tapValue: false,
                onTap: () {},
                havingFlag: false,
              ),
              SizedBox(height: 12.h),
              Text(
                "PASSWORD",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "PoppinsBold",
                ),
              ),
              SizedBox(height: 9.h),
              InputTextField(
                hintText: "Enter Password",
                prefixVisibility: true,
                fieldController: loginController.passwordController.value,
                obscurance: loginController.eyeTap.value,
                tapValue: loginController.eyeTap.value,
                onTap: () {
                  loginController.eyeTap.value = !loginController.eyeTap.value;
                },
                IconChange: loginController.eyeTap.value, havingFlag: false
                ,
              ),
              SizedBox(height: 9.h),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 7.w),
                  child: Text(
                    "Forgot password?",
                    style:
                    TextStyle(fontSize: 12.sp, color: AppColors.kLightBlue),
                  ),
                ),
              ),
              SizedBox(height: 29.h),
              Center(
                child: Column(
                  children: [
                    PanelButtons(
                      buttonText: loginController.isLoading.value == true
                          ? "Please wait....."
                          : "Login",
                      buttonColor: AppColors.mainColor,
                      textColor: AppColors.mainBg,
                      onTap: () {
                        loginController.isLoading.value == true
                            ? null
                            :
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(FocusNode());
                        loginController.login();
                        loginController.passwordController.value.clear();
                        loginController.emailController.value.clear();
                        loginController.eyeTap.value = true;
                      },
                      borderColor: AppColors.mainColor,
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "or",
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: "PoppinsBold",
                          color: AppColors.kLightGrey),
                    ),
                    SizedBox(height: 4.h),
                    PanelButtons(
                      buttonText: "Create an account",
                      buttonColor: AppColors.kWhite,
                      textColor: AppColors.welcomeTwiddle,
                      onTap: () {
                        Get.to(() => CreateAccount());
                      },
                      borderColor: Colors.black12,
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                          text: "By signing in you agree to our ",
                          style: TextStyle(
                              fontSize: 10.sp, color: AppColors.kLightGrey),
                          children: [
                            TextSpan(
                                text: "Terms of service",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.mainColor,
                                    fontFamily: "PoppinsBold"))
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),)

        ),
      ),
    );
  }

  // Future<void> apisign_in() async {
  //   //final prefs = await SharedPreferences.getInstance();
  //   final storage = FlutterSecureStorage();
  //   //String token = await getToken()
  //   //var url = "https://google6666.herokuapp.com/login";
  //   var url = "https://twidle-agent-api.herokuapp.com/api/user/login";
  //   var data = {
  //     'type': type as String,
  //     'email': email.text.trim(),
  //     'password': password.text.trim(),
  //     //'img': image
  //   };
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //
  //   // prefs.setString("token", token);
  //   // String token;
  //   // prefs.setString("token", token);
  //   //String token = prefs.getString("token");
  //
  //   // var boddy = json.encode(data);
  //   var jsonResponse;
  //   var urlparse = Uri.parse(url);
  //   http.Response response = await http.post(
  //     urlparse,
  //     body: data,
  //     // headers: {"Content-Type": "Application/json", "Authorization": "Bearer $token"}
  //   );
  //
  //   print(response.statusCode);
  //
  //   // print(userDetails);
  //   // print('Token : ${token}');
  //   // print('Response Body : ${response.body}');
  //
  //   if (response.statusCode == 200) {
  //     // print(LoginResponseModel());
  //     FutureBuilder(
  //         future: apisign_in(),
  //         builder: (context, snapshot) {
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             print(userDetails);
  //             // print('token');
  //           }
  //           return AlertDialog(
  //             title: Icon(
  //               Icons.arrow_circle_right,
  //               color: Colors.green,
  //               size: 30,
  //             ),
  //             content: Text(
  //               "Check your email to verify/n the account",
  //               textAlign: TextAlign.center,
  //             ),
  //             actions: [
  //               Text(
  //                 "larry.johns@gmail.com",
  //                 textAlign: TextAlign.center,
  //               ),
  //               Container(
  //                 height: MediaQuery.of(context).size.height * 0.052,
  //                 width: MediaQuery.of(context).size.width * 0.8,
  //                 decoration:
  //                     BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
  //               )
  //             ],
  //           );
  //         });
  //     print(response.statusCode);
  //     Fluttertoast.showToast(
  //       msg: "Login Successfull",
  //       backgroundColor: Colors.green,
  //     );
  //     // Get.to(()=>BottomNav());
  //     // print('ok');
  //     //_launchUrl;
  //     // Future getdat() async {
  //     //   var res = await http.get(
  //     //     Uri.https('google6666.herokuapp.com', 'auth/google'),
  //     //   );
  //     //   print(res);
  //     //   return res;
  //     // }
  //   } else if (response.statusCode == 400) {
  //     Fluttertoast.showToast(
  //         msg: "Invalid Credentials", backgroundColor: Colors.red);
  //   } else {
  //     print(response.body);
  //   }
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // //now set the token inside the shared_preferences
  //   // //I assumed that the token is a field in the json response, but check it before!!
  //   // await prefs.setString('token',responseJson['token']);
  //   // return responseJson;
  // }
}

class BG extends StatelessWidget {
  Widget? child;
  String? type;

  BG({Key? key, this.child, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        type == 'Service Provider'
            ? Positioned(
                top: 0,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.66,
                  child: Image.asset("assets/sp/sp_bg.png", fit: BoxFit.cover),
                ))
            : Positioned(
                top: 0,
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.66,
                  child: Image.asset("assets/login.png", fit: BoxFit.cover),
                )),
        Positioned(
            top: 40,
            left: 15,
            child: MyBackButton(
              color: white,
              iconColor: black,
            )),
        Positioned.fill(
          top: Get.height * 0.45,
          child: Container(
            height: Get.height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//
// class NetworkHandler{
//   static final client = http.Client();
//   static final storage = FlutterSecureStorage();
//   static Future<String> post (var body, String endpoint) async{
//   var response = await client.post(builderUrl(endpoint),
//   body: body,
//     headers: {
//               "Content-type": "application/json"
//     }
//   );
//   return response.body;
//   }
//   static Uri builderUrl(String endpoint){
//     String host = 'https://twidle-agent-api.herokuapp.com/api/user/login';
//     final apiPath = host+endpoint ;
//     return Uri.parse(apiPath);
//   }
//   static void storeToken(String token) async{
//     await storage.write(key:"token", value:token);
//   }
//   static Future<String?> getToken(String token) async {
//     return await storage.read(key: "token");
//   }
// }

//
//
// class LoginController extends GetxController{
//   TextEditingController email =TextEditingController();
//   TextEditingController password = TextEditingController();
//   LoginApiService loginData = LoginApiService();
//   var isLoading = false.obs;
//
//   String? token;
//   getToken()async {
//     await (loginData.getLoginData(email.text,password.text));
//
//     if(loginData.loginData.errorCode ==0){
//       return token = loginData.loginData.data!.token!.access;
//     }
//     else{
//       return token = 'null';
//     }
//   }
//   isValidUser()async{
//     if (email.text.isEmpty){
//       Get.snackbar('Error', "Email not be empty");
//     }
//     else if(password.text.isEmpty){
//       Get.snackbar('Error', "Password is required");
//     }
//     else {
//       await (loginData.getLoginData(email.text,password.text));
//     }
//   }
// }
//
// class LoginApiService{
//   LoginModel loginData =LoginModel();
//   getLoginData(String email, String password) async{
//     LoginController controller = Get.put(LoginController());
//     controller.isLoading.value = true;
//     var response = await http.post(Uri.parse(ApiEndPoints.baseUrl+ ApiEndPoints.login),
//     body: {
//       'email' : email,
//       'password': password,
//     },
//       headers: {
//       "Accpet" : "application/json",
//         "Access-Control_Allow_Origin": "*",
//       }
//     );
//     controller.isLoading.value = false;
//     if(response.statusCode== 200){
//       var data = jsonDecode(response.body);
//       loginData = LoginModel.fromJson(data);
//       if (loginData.errorCode !=0){
//         Get.snackbar("Error", loginData.errorMsg.toString());
//       }
//       else {
//         Get.offAllNamed('dashboard');
//       }
//       return loginData;
//
//     }
//       else {
//         Exception("Data not Loaded");
//     }
//     }
//   }
//
class LoginResponseModel {
  Userdetail? userdetail;
  String? token;

  LoginResponseModel({this.userdetail, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userdetail = json['userdetail'] != null
        ? new Userdetail.fromJson(json['userdetail'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userdetail != null) {
      data['userdetail'] = this.userdetail!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Userdetail {
  String? fullname;
  String? type;
  String? email;
  String? avatar;

  Userdetail({this.fullname, this.type, this.email, this.avatar});

  Userdetail.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    type = json['type'];
    email = json['email'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['type'] = this.type;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    return data;
  }
}
