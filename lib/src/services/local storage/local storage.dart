import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static writeString({required String key, required String value}) {
    final GetStorage getStorage = GetStorage();
    getStorage.write(key, value);
  }

  static String readString({required String key}) {
    final GetStorage getStorage = GetStorage();
    String value = getStorage.read(key);
    return value;
  }
}

class LocalStorageKeys {
  // static String fcmToken = 'fcmToken';
  static String accessToken = 'accessToken';
}
//
// class SharedPrefer{
//   static headertoken(Map header) async{
//     var response = header;
//     var any = await SharedPreferences.getInstance();
//     any.setString("header", );
//   }
// }