import 'package:flutter/material.dart';
import 'package:state_agent/service_provider/bottom_navigation/dashboard/sp_dashboard.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../constants/hive/hive.dart';
import '../../landing_screen/welcome_page.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(user.get('id') != null){

      if(user.get('type') == 'Real Estate'){
        return BottomNav();
      }
      else if(user.get('type') == 'Service Provider'){
        return SPDashboard();
      }
      else if(user.get('type') == 'FSP'){
        return SPDashboard();
      }
      else{
        return WelcomePage();
      }
    }else{
      return WelcomePage();
    }
  }
}
