import 'package:eva_app/utilities/app_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show get, post, Response;

class EvaApi {
  Uri apiUrl = Uri();
  final EvaPreferences _evaPreference = EvaPreferences();

  EvaApi() {
    apiUrl = Uri.parse("${_evaPreference.getServerApiUrl()}");
  }

  login() async {
    Response response =
        await get(Uri.parse("${_evaPreference.getServerApiUrl()}/api/state"));
    debugPrint(response.body);
  }

  checkCommand(String command) {
    var uriBody = {"OSType": "linux", "command": command};
    Future<Response> response = post(
        Uri.parse("${_evaPreference.getServerApiUrl()}/api/ai/check"),
        body: uriBody);
    print(response);
  }
}
