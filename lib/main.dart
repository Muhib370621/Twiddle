import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_strings.dart';
import 'package:twiddle_refactored/src/presentation/screens/onboarding/splashScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.title,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          fontFamily: 'PoppinsMedium',
          backgroundColor: Colors.white,
        ),
        home: const SplashScreen(),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
              boldText: false,
            ),
            child: child!,
          );
        },
      );
    });
  }
}
