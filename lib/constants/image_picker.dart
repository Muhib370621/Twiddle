import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

String? imageUrl;

uploadImage() async{
  final _storage = FirebaseStorage.instance;
  final _picked = ImagePicker();
  PickedFile? image;

  /// Check Permissions
  await Permission.phone.request();

  var permissionStatus = await Permission.photos.status;

  if(permissionStatus.isGranted){
    /// Select Image
    image = await _picked.getImage(source: ImageSource.gallery);
    var file = File(image!.path);
    if(image != null){
      /// Upload to Firebase Storage
      var snapshot = await _storage.ref().child('Images/imageName').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      // setState(() {
      //   imageUrl = downloadUrl;
      // });
      imageUrl = downloadUrl;
    }
    else{
      Fluttertoast.showToast(msg: 'No image received');
    }
  }
  else{
    Fluttertoast.showToast(msg: 'Grant Permissions and try again');
  }

}

uploadUniImage() async{
  final _storage = FirebaseStorage.instance;
  final _picked = ImagePicker();
  PickedFile? image;

  /// Check Permissions
  await Permission.phone.request();

  var permissionStatus = await Permission.photos.status;

  if(permissionStatus.isGranted){
    /// Select Image
    image = await _picked.getImage(source: ImageSource.gallery);

    var file = File(image!.path);
    String fileName = Uuid().v1();


    if(image != null){
      /// Upload to Firebase Storage
      var snapshot = await _storage.ref().child('Images/$fileName.jpg').putFile(file);
      var downloadUrl = await snapshot.ref.getDownloadURL();

      // setState(() {
      //   imageUrl = downloadUrl;
      // });
      return imageUrl = downloadUrl;
    }
    else{
      Fluttertoast.showToast(msg: 'No image received');
    }
  }
  else{
    Fluttertoast.showToast(msg: 'Grant Permissions and try again');
  }

}