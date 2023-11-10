import 'dart:async';
import 'dart:convert';
import 'package:eva_app/utilities/app_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_preferences.dart';

class EvaActions {
  final EvaPreferences _evaPreference = EvaPreferences();
  final EvaApi _evaApi = EvaApi();

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
    String hintText = "server_${inputFieldHintText.toLowerCase()}";
    if (hintText == "server_url") {
      _evaPreference.setServerUrl(newValue);
    } else if (hintText == "server_port") {
      _evaPreference.setServerPort(newValue);
    }
  }

  Future<String?> getValue(shownHinttext) {
    String hintText = "server_${shownHinttext.toLowerCase()}";
    if (hintText == "server_url") {
      final serverUrl = _evaPreference.getServerUrl();
      return serverUrl;
    }
    if (hintText == "server_port") {
      final serverPort = _evaPreference.getServerPort();
      return serverPort;
    }
    return Future(() => "");
  }

  void login() async {
    await http
        .get(Uri.parse(_evaApi.login()))
        .then((value) => debugPrint("VALUE: ${json.decode(value.body)}"))
        .onError((error, stackTrace) => debugPrint("$error"));
  }
}
