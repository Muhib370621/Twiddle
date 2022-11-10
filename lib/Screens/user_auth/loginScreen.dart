import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_agent/constants/methods.dart';
import '../../Api_Services/user/login_controller.dart';
import '../../Utilities/comp_screen.dart';
import '../../constants/constants.dart';
import 'CreateAccount/createAcount.dart';
import 'ForgotPassword/forgotPassword.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  LoginController loginController = Get.put(LoginController());

  getuser() async{
    QuerySnapshot userSnap = await firestore.collection('users').where('email', isEqualTo: auth.currentUser?.email).get();
    if(userSnap.docs != null && userSnap.docs.isNotEmpty){
      setState(() {
        authUser = userSnap.docs[0].data();
      });
      loginWithAccType(email.text, password.text, type);
    }
  }

  bool show = true;
  final email = TextEditingController(text: "check@gmail.com");
  final password = TextEditingController(text: "1234567");
  final control = SignUpController();
  String? type;
  List types = [
    "Real Estate", "FSP", "Service Provider"
  ];

  late Map userDetails;
  loginUser(){
    userDetails = {
      'type': type,
      'email': email.text.trim(),
      'password': password.text,
    };

    loginController.login(userDetails);
    //loginController.loginData(userDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: BG(
          type: type,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Height(size: 30),
              PoppinsText(text: 'Welcome Back!', size: 22, fontWeight: FontWeight.bold),

              // Height(size: 5),
              //
              // PoppinsText(text: 'Enter your email or number', fontWeight: FontWeight.w500, color: hinttext),

              Height(size: 20),

              PoppinsText(text: 'LOGIN AS: ', size: 14, fontWeight: FontWeight.w500),
              Height(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: Get.height/(812/45),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    icon: Icon(Icons.keyboard_arrow_down, color: maincolor,),
                    isExpanded: true,
                    items: types.map((value) => DropdownMenuItem(
                      child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                      value: value,
                    )).toList(),
                    onChanged: (val){
                      setState(() {
                        type = val as String?;
                      });
                    },
                    value: type,
                    hint: PoppinsText(text: "Account Type", fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              // TypeDropdown(),

              Height(size: 15),
              PoppinsText(text: 'EMAIL ADDRESS', fontWeight: FontWeight.w500),
              Height(),
              MyTextField(
                radius: 5, height: 45,
                controller: email,
                borderColor: black,
              ),

              Height(size: 15,),
              PoppinsText(text: 'PASSWORD', fontWeight: FontWeight.w500),
              Height(),
              MyTextField(
                radius: 5,  height: 45,
                controller: password,
                borderColor: black,
                onSuffixIconTap: (){
                  setState(() {
                    show = !show;
                  });
                },
                obscureText: show,
                suffixIcon: show == false ? Icons.remove_red_eye : Icons.visibility_off_rounded,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  child: PoppinsText(text: 'Forgot password?', color: maincolor),
                  onPressed: () {
                    Get.to(()=>ForgotPassword());

                  },
                ),
              ),
              Height(size: 20),
              Button(
                text: "Login",
                onTap: () {
                  if( email.text.isEmpty && password.text.isEmpty)
                  {
                    Fluttertoast.showToast(msg: "Enter All Fields");
                  }
                  else if(!email.text.contains('@')||!email.text.contains('.com'))
                  {
                    Fluttertoast.showToast(msg: "Invalid Email");
                  }
                  else if(type == null){
                    Fluttertoast.showToast(msg: "Invalid account type");
                  }
                  else
                  {
                    // Fluttertoast.showToast(
                    //     msg: "Login Successfully");
                   //  loginWithAccType(email.text, password.text, type);
                 //    getuser();
                  apisign_in();
                //   loginUser();
                    // UserModel.fetchUser();

                  }

                },
              ),
              Height(),
              Center(child: PoppinsText(text: 'or', size: 14)),
              Height(),
              Button(
                borderColor: black,
                buttonColor: white,
                color: black,
                text: "Create an account",
                onTap: () {
                  Get.to(()=>CreateAccount());
                },

              ),

              Height(size: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoppinsText(text: "By signing in you agree to our ", fontWeight: FontWeight.w500),
                  PoppinsText(text: "Terms of Service", fontWeight: FontWeight.w500, color: maincolor,),
                ],
              ),
              Height(size: 20),
            ],
          ),
        ),
      ),
    );
  }



  Future<void> apisign_in() async {

  //final prefs = await SharedPreferences.getInstance();
  final storage = FlutterSecureStorage();
  //String token = await getToken()
    //var url = "https://google6666.herokuapp.com/login";
    var url = "https://twidle-agent-api.herokuapp.com/api/user/login";
    var data = {
      'type': type as String,
      'email': email.text.trim(),
      'password': password.text.trim(),
      //'img': image
    };
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    // prefs.setString("token", token);
    // String token;
    // prefs.setString("token", token);
    //String token = prefs.getString("token");

    // var boddy = json.encode(data);
    var jsonResponse;
    var urlparse = Uri.parse(url);
    http.Response response = await http.post(
      urlparse,
      body: data,
   // headers: {"Content-Type": "Application/json", "Authorization": "Bearer $token"}
    );

    print(response.statusCode);


    // print(userDetails);
  // print('Token : ${token}');
  // print('Response Body : ${response.body}');

    if (response.statusCode == 200) {
     // print(LoginResponseModel());
      FutureBuilder(
          future: apisign_in(),
         builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done)
              {
                print(userDetails);
                // print('token');
              }
            return AlertDialog(
              title: Icon(Icons.arrow_circle_right, color: Colors.green,size: 30,),
              content: Text("Check your email to verify/n the account",textAlign: TextAlign.center,),
              actions: [
                Text("larry.johns@gmail.com",textAlign: TextAlign.center,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.052,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                )
              ],
            );
         }
      );
      print(response.statusCode);
      Fluttertoast.showToast(msg: "Login Successfull",
        backgroundColor: Colors.green,
      );
      // Get.to(()=>BottomNav());
       // print('ok');
      //_launchUrl;
      // Future getdat() async {
      //   var res = await http.get(
      //     Uri.https('google6666.herokuapp.com', 'auth/google'),
      //   );
      //   print(res);
      //   return res;
      // }
    }

    else if(response.statusCode == 400){
      Fluttertoast.showToast(msg: "Invalid Credentials",
      backgroundColor: Colors.red);
    }
    else{
      print(response.body);
    }
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // //now set the token inside the shared_preferences
  // //I assumed that the token is a field in the json response, but check it before!!
  // await prefs.setString('token',responseJson['token']);
  // return responseJson;
  }

}

class BG extends StatelessWidget {
  Widget? child; String? type;
  BG({Key? key, this.child, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        type == 'Service Provider'?
        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.66,
              child: Image.asset("assets/sp/sp_bg.png",fit: BoxFit.cover),
            )) :
        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.66,
              child: Image.asset("assets/login.png",fit: BoxFit.cover),
            )),

        Positioned(
            top: 40, left: 15,
            child: MyBackButton(
              color: white,
              iconColor: black,
            )
        ),

        Positioned.fill(
          top: Get.height * 0.30,
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