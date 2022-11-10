import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../navi_ownerPro.dart';
import 'owner_emailVeri.dart';

class MainPageOwner extends StatelessWidget {
  const MainPageOwner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return EmailVerOwner();
            }else{
              return NaviOwnerPro();
            }
          }

      )
  );
}

