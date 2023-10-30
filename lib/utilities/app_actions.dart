import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_preferences.dart';

class EvaActions {
  final EvaPreferences _evaPreference = EvaPreferences();

  navigateTo(context, [routingPage]) {
    {
      if (routingPage != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routingPage));
      } else {
        Navigator.pop(context);
      }
    }
  }

  saveNewValue(String text, String valuetype){
    if(valuetype == "username"){
      _evaPreference.setServerUsername(text);
    }
    else if(valuetype == "password"){
      _evaPreference.setServerPassword(text);
    }
    else if(valuetype == "server_ip"){
      _evaPreference.setServerIp(text);
    }
    else if(valuetype == "server_port"){
      _evaPreference.setServerPort(text);
    }
  }
}
