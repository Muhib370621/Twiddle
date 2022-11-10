import 'package:permission_handler/permission_handler.dart';

Future<bool> reqPermission(Permission permission) async{
  if(await permission.isGranted)
    return true;
  else{
    var result = await permission.request();
    if(result == permission.isGranted){
      return true;
    }
    else{
      return false;
    }
  }
}