import 'package:eva_app/utilities/app_preferences.dart';
import 'package:flutter/material.dart';

class EvaActions {
  final EvaPreferences _evaPreference = EvaPreferences();

  void navigateTo(context, [routingPage]) {
    {
      if (routingPage != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routingPage));
      } else {
        Navigator.pop(context);
      }
    }
  }


  saveNewValue(String inputFieldHintText, String newValue){
    String hintText = "server_${inputFieldHintText.toLowerCase()}";
    if(hintText == "server_url"){
      _evaPreference.setServerUrl(newValue);
    } else if(hintText == "server_port"){
      _evaPreference.setServerPort(newValue);
    }
  }
}
