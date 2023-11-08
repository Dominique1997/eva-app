import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_preferences.dart';
import 'package:http/http.dart' show get, Response;

class EvaApi {
  Uri? apiUrl;
  EvaPreferences? _evaPreference;

  EvaApi(){
    this._evaPreference = EvaPreferences();
    this.apiUrl = Uri.parse("${_evaPreference?.getServerApiUrl()}");
  }

  login() async {
    Response response = await get(Uri.parse("${apiUrl as Uri}/api/state"));
    print(response.body);
  }
  
}
