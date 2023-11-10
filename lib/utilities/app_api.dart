import 'package:eva_app/utilities/app_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show get, Response;

class EvaApi {
  Uri? apiUrl;
  EvaPreferences? _evaPreference;

  EvaApi(){
    _evaPreference = EvaPreferences();
    apiUrl = Uri.parse("${_evaPreference!.getServerApiUrl()}");
  }

  login() async {
    Response response = await get(Uri.parse("$apiUrl/api/state"));
    debugPrint(response.body);
  }
  
}
