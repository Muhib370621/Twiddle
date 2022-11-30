import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:state_agent/Screens/user_auth/CreateAccount/createAcount.dart';
import 'package:state_agent/Screens/user_auth/loginScreen.dart';
import 'package:state_agent/user/google_signin.dart';

import 'landing_screen/animated_splash.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notification',
//     description: 'This channel is used for important notifications',
//     importance: Importance.high,
//     playSound: true
// );
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
//   await Firebase.initializeApp();
//   print("A bg message: ${message.messageId}");
// }


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp();
  await Hive.openBox('user');
  await GetStorage.init();

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroungHandler);
  //
  // await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  // ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true
  // );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future<bool> _onWillPop() async {
      return false;
    }
    return FirebaseNotificationsHandler(
      child: ScreenUtilInit(
        builder: (context, child )=> WillPopScope(
          onWillPop: _onWillPop,
          child: ChangeNotifierProvider(
            create: (context) => GoogleSigninProvider(),
            child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Twiddle',
              //routes: {'/reportAgent': (context) => ReportAgent()},
              theme: ThemeData(
                  fontFamily: 'PoppinsMedium',
                platform: TargetPlatform.iOS,
                primarySwatch: Colors.blue
              ),
              home:
              //CreateAccount()
              AnimatedSplash(), //BottomNav()//Demo()
              getPages: [
                GetPage(name: '/login', page: ()=> LoginScreen()),
                GetPage(name: '/register', page: ()=> CreateAccount()),
              ],
            ),
          ),
        ),
        designSize: Size(375, 812),
      ),
    );
  }
}
