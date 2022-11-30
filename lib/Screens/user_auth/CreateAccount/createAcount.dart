import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:state_agent/Api_Services/image_controller.dart';
import 'package:state_agent/Screens/user_auth/loginScreen.dart';

import '../../../Api_Services/user/signup_controller.dart';
import '../../../constants/constants.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  bool show = true;
  final fname = TextEditingController(text: 'hamza');
  final lname = TextEditingController(text: 'abbas');
  final number =TextEditingController(text: '+233 979374');
  final email = TextEditingController(text: 'hamza@gmail.com');
  final password =TextEditingController(text: '123');

  SignupController signupController = Get.put(SignupController());
  ImageController imageController = Get.put(ImageController());
  late Map<String, dynamic> userDetails;

  register(String lname, String fname, String type, String number, String email,
      String password, File image) {
    // var file = image.path;
    String base64Image = base64Encode(image.readAsBytesSync());
    String file = image.path.split('/').last.split('image_picker').last;
    userDetails = {
      'first_name': fname,
      'last_name': lname,
      'type': type,
      'phone': number,
      'email': email,
      'password': password,
      'profile_pic': file
    };

    //signupController.uploadData(base64Image, fileName, userDetails);
    // signupController.register(userDetails);
    print(file);
  }

  String? type;

  List types = ["Real Estate", "FSP", "Service Provider"];
  File? imageFile;

  Future uploadmultipleimage(
    String filename,
  ) async {

    final multipartRequest = new http.MultipartRequest(

      "POST",

      Uri.parse(
        //"https://google6666.herokuapp.com/signup",
        // New API
        "https://twidle-agent-api.herokuapp.com/api/user"
        //"https://twidle-agent-api.herokuapp.com/api/user"
      ),

    );

    var userHeader = {"Accept": "application/json"};

    multipartRequest.headers.addAll(userHeader);
    //request.headers.addAll({“Authorization”: “Bearer ”});
    multipartRequest.fields.addAll({
      "firstname": fname.text.trim(),
      "lastname": lname.text.trim(),
      "email": email.text.trim(),
      "phone": number.text.trim(),
      'type': type.toString(),
      "password": password.text.trim(),
    });

    multipartRequest.files.add(

      http.MultipartFile.fromBytes('img', imageFile!.readAsBytesSync(),
          //imageFile!.lengthSync(),
          filename: filename.split("/").last),
    );


    http.StreamedResponse response = await multipartRequest.send();
    var responseString = await response.stream.bytesToString();

    print(response.statusCode);
  //  print(response.body);
    //print(response.body);



    //var data = jsonDecode();
    if (response.statusCode == 200) {
      Get.to(()=> LoginScreen());
      Fluttertoast.showToast(msg: "Successfully Registered",
      backgroundColor: Colors.green);
      return

      // return userDetails.fromJson(jsonDecode(response))
       print('ok');

    }
    else if(response.statusCode == 400){
      Fluttertoast.showToast(msg: "Email Already Registered",
      backgroundColor: Colors.red,
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: GetBuilder<ImageController>(builder: (imageController) {
          return Container(
            child: BG(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Height(size: 30),
                  PoppinsText(
                      text: 'Create new account',
                      size: 22,
                      fontWeight: FontWeight.bold),
                  Height(size: 5),
                  PoppinsText(
                      text: 'Respond to the following and proceed.',
                      fontWeight: FontWeight.w500,
                      color: hinttext),
                  Height(size: 15),
                  photoUrl == null
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      //  height: MediaQuery.of(context).size.height/5,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      height: Get.height / (812 / 170),
                                      color: Colors.white,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //Height(size: 30),

                                            PoppinsText(
                                                text: 'Select Your Profile',
                                                size: 22,
                                                fontWeight: FontWeight.bold),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                // const Text('Select Profile Picture'),
                                                //  Column(mainAxisAlignment: MainAxisAlignment.center,
                                                //    children: [
                                                //    Text('Select Image',style: TextStyle(fontSize: 30),),
                                                //  ],),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _getFromGallery();
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    child: Icon(Icons.photo,
                                                        size: 30,
                                                        color:
                                                            Colors.grey[600]),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                  ),
                                                ),
                                                Width(size: 20),
                                                GestureDetector(
                                                  onTap: () {
                                                    _getFromCamera();
                                                  },
                                                  child: Container(
                                                    height: 60,
                                                    width: 60,
                                                    child: Icon(
                                                      Icons.camera_alt_sharp,
                                                      size: 30,
                                                      color: Colors.grey[600],
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40)),
                                                  ),
                                                ),
                                                // ElevatedButton(
                                                //   child: const Text('Gallery'),
                                                //   onPressed: () {
                                                //     _getFromGallery();
                                                //   },
                                                // ),
                                                // ElevatedButton(
                                                //   child: const Text('Close BottomSheet'),
                                                //   onPressed: () {
                                                //     _getFromCamera();
                                                //   },
                                                // ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                                // imageController.getImage();
                              },
                              child: MyContainer(
                                width: 60, height: 60,
                                //color: lightButton, radius: 30,
                                // child: Icon(Icons.add_a_photo, color: hinttext),
                                child: imageFile == null
                                    ? Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Color(0xffE9E9EC),
                                          // image: DecorationImage(
                                          //     image: AssetImage('assets/talha.jpg'),
                                          //     fit: BoxFit.fill)
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(
                                          Icons.add_a_photo_outlined,
                                          size: 25,
                                          color: Color(0xff9C9C9C),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            50), // Image border
                                        child: SizedBox.fromSize(
                                          size: Size.fromRadius(
                                              80), // Image radius
                                          child: Image.file(
                                            imageFile!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                              ),
                            ),

                            Width(
                              size: 20,
                            ),
                            // GestureDetector(
                            //   onTap: (){
                            //     getImage();//imageController.getImage();
                            //   },
                            //   child: MyContainer(
                            //     width: 60, height: 60,
                            //     color: lightButton, radius: 30,
                            //     child: Icon(Icons.image, color: hinttext),
                            //   ),
                            // ),
                          ],
                        )
                      : Picture(
                          size: 60,
                          file: photoUrl!.path,
                          fit: BoxFit.cover,
                        ),
                  Height(),
                  PoppinsText(
                      text:
                          'Select a presentable photo for yourself this is very important.',
                      size: 10,
                      fontWeight: FontWeight.w500,
                      color: hinttext),
                  Height(size: 20),
                  PoppinsText(text: 'SIGNUP AS:', fontWeight: FontWeight.w500),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: Get.height / (812 / 45),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: grey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: maincolor,
                        ),
                        isExpanded: true,
                        items: types
                            .map((value) => DropdownMenuItem(
                                  child: PoppinsText(text: value, fontWeight: FontWeight.w500),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            type = val as String?;
                          });
                        },
                        value: type,
                        hint: PoppinsText(
                            text: "Account Type", fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Field(
                    text: 'FIRST NAME',
                    controller: fname,
                    error: " Enter First Name",
                  ),
                  Field(
                    text: 'last name',
                    controller: lname,
                    error: "Enter Last Name",
                  ),
                  Field(
                    text: 'phone number',
                    controller: number,
                    error: "Enter Phone Number ",
                  ),
                  Field(
                    text: 'email address',
                    controller: email,
                    error: "Enter Email Address",
                  ),
                  Height(
                    size: 15,
                  ),
                  PoppinsText(text: 'PASSWORD', fontWeight: FontWeight.w500),
                  Height(),
                  MyTextField(
                    radius: 5,
                    height: 45,
                    controller: password,
                    borderColor: black,

                    onSuffixIconTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    obscureText: show,
                    suffixIcon: show == false
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_rounded,
                  ),
                  Height(size: 20),
                  Button(
                    text: "Continue",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                      if ( fname.text.isEmpty ||
                          lname.text.isEmpty ||
                          number.text.isEmpty ||
                          email.text.isEmpty ||
                          password.text.isEmpty ) {
                        Fluttertoast.showToast(msg: "Enter All Fields");
                      } else if (!email.text.contains('@') ||
                          !email.text.contains('.com')) {
                        Fluttertoast.showToast(msg: "Invalid Email");
                      } else if (type == null) {
                        Fluttertoast.showToast(
                            msg: "please select your account type");
                      }
                      // else if(http.Response==200){
                      //     Fluttertoast.showToast(msg:"Successfully Registered",
                      //     backgroundColor: Colors.green);
                      // }
                      else {
                        //createAccount(fname.text, lname.text, email.text, password.text, contact.text, type);

                         uploadmultipleimage("profile.jpg");
                         //Get.to(()=>LoginScreen());
                       //  Get.to()
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => LoginScreen()),
                        // );
                        //
                        register(
                            lname.text,
                            fname.text,
                            type!,
                            number.text.trim(),
                            email.text.trim(),
                            password.text,
                            photoUrl!
                        );
                      }
                    },
                  ),
                  Height(size: 20),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    //print(imageFile);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print(imageFile);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  File? photoUrl;

  captureImage() async {
    final _picked = ImagePicker();
    PickedFile? image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      image = await _picked.getImage(source: ImageSource.camera);

      var file = File(image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          photoUrl = file;
        });
        print(photoUrl);
        return photoUrl;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }

  getImage() async {
    final _picked = ImagePicker();
    PickedFile? image;

    /// Check Permissions
    await Permission.phone.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      /// Select Image
      image = await _picked.getImage(source: ImageSource.gallery);

      var file = File(image!.path);
      //String fileName = Uuid().v1();

      if (file != null) {
        setState(() {
          photoUrl = file;
        });
        print(photoUrl);
        return photoUrl;
      } else {
        Fluttertoast.showToast(msg: 'No image received');
      }
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
    }
  }
}

class BG extends StatelessWidget {
  Widget? child;

  BG({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            child: SizedBox(
              width: Get.width,
              height: Get.height * 0.3,
              child: Image.asset("assets/reg.png", fit: BoxFit.cover),
            )),
        Positioned(
            top: 40,
            left: 15,
            child: MyBackButton(
              color: white,
              iconColor: black,
            )),
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
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Field extends StatelessWidget {
  String? text;
  String? hint;
  TextEditingController? controller;
  String? error;

  Field({Key? key, this.text, this.hint, this.controller, this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Height(
          size: 15,
        ),
        PoppinsText(text: text!.toUpperCase(), fontWeight: FontWeight.w500),
        Height(),
        MyTextField(
          radius: 5,
          height: 40,
          controller: controller,
          borderColor: black,
          hint: hint != null ? hint! : '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return error;
            }
            return null;
          },
        ),
      ],
    );
  }
}
