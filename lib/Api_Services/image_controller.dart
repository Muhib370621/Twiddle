import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'user/login_controller.dart';

class ImageController extends GetxController{


  PickedFile? _pickedFile;
  PickedFile? get pickedImage => _pickedFile;
  File? image;
  final _picker = ImagePicker();

  getImage() async{
    _pickedFile = await _picker.getImage(source: ImageSource.camera);
    update();
  }

  // Future<PostImage> postImage(File image) async{
  //   String fileName = image.path.split('/').last;
  //   print(fileName);
  //
  //   try{
  //     Dio dio = new Dio();
  //     FormData formData = FormData.fromMap({
  //       "file": await MultipartFile.fromFile(image.path,filename: fileName)
  //     });
  //     Map<String, String> headers= <String,String>{
  //       'Content-Type':'multipart/form-data'
  //     };
  //     print("${baseURL}files/upload");
  //     Response response = await dio.post("${baseURL}files/upload",data: formData);
  //     if(response.statusCode == 200){
  //       print("Uploaded");
  //     }
  //     else{
  //       print(response.data);
  //     }
  //
  //   }
  //   catch(e){
  //     print(e);
  //   }
  //
  // }

//   Future<bool> upload() async{
//
//     update();
//     bool success = false;
//
//     // http.StreamedResponse response = await updateProfile(_pickedFile);
//
//     if(response.statusCode == 200){
//       Map map = jsonDecode(await response.stream.bytesToString());
//       String message = map['message'];
//       success = true;
//       Fluttertoast.showToast(msg: message);
//     }
//     else {
//       Fluttertoast.showToast(msg: 'Error uploading image');
//     }
//     update();
//     return success;
// }

// Future<http.StreamedResponse> updateProfile (PickedFile? data) async{
//     // http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(LoginController.baseUrl+'/signup'));
//
//     if(GetPlatform.isMobile && data != null){
//       File _file = File(data.path);
//       // request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync()));//, filename: _file.path.split()));
//     }
//
//     // http.StreamedResponse response = await request.send();
//     // return response;
// }

}