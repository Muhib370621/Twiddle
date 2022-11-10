import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../loginScreen.dart';
import 'email_verified.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return EmailVerification();
            }else{
              return LoginScreen();
            }
          }

      )
  );
}

