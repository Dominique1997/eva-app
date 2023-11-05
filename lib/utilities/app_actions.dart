import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_preferences.dart';

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

  void saveNewValue(String inputFieldHintText, String newValue) {
    _evaPreference.initState();
    String hintText = "server_${inputFieldHintText.toLowerCase()}";
    if (hintText == "server_url") {
      _evaPreference.setServerUrl(newValue);
    } else if (hintText == "server_port") {
      _evaPreference.setServerPort(newValue);
    }
  }

  String getValue(shownHinttext) {
    _evaPreference.initState();
    String hintText = "server_${shownHinttext.toLowerCase()}";

    if (hintText == "server_url") {
      final serverUrl = _evaPreference.getServerUrl();
      return serverUrl;
    }
    if (hintText == "server_port") {
      final serverPort = _evaPreference.getServerPort();
      return serverPort;
    }
    return "UNKNOWN";
  }

  void login() async {
    String url = "http://127.0.0.1/api/status";
    await http
        .get(Uri.parse(url))
        .then((value) => print("VALUE: ${json.decode(value.body)}"))
        .onError((error, stackTrace) => print("${error}"));
  }
}
