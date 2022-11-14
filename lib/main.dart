import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:twiddle_refactored/src/core/utils/app_strings.dart';
import 'package:twiddle_refactored/src/presentation/screens/onboarding/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.title,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: const SplashScreen(),
      );
    });
  }
}