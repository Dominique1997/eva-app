import 'dart:convert';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/pages/home/homepage.dart';
import 'package:eva_app/utilities/app_values.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get, post, patch, put;

class EvaApi {
  late String apiUrl;
  late int apiPort;
  late EvaActions _evaAction;
  late EvaAppValues _evaAppValues;
  late Map<String, String> uriHeader;

  EvaApi() {
    _evaAppValues = EvaAppValues();
    _evaAppValues.getServerPort().then((value) => apiPort = int.parse(value));
    _evaAppValues.getServerUrl().then((value) => apiUrl = value);
    uriHeader = {'Content-Type': 'application/json'};
  }

  login(BuildContext context) async {
    _getRequest("/api/status").then((value) => {
          if (jsonDecode(value.body)["api_state"] == true)
            {_evaAction.navigateTo(context, const HomePage())}
        });
  }

  checkCommand(String command) {
    var data = jsonEncode(
        {'token': 'UNKNOWN', 'OSType': 'windows', 'command': command});
    _postRequest("/api/ai/check", data)
        .then((value) => debugPrint(
            "The answer coming from the api is ${jsonDecode(value.body)["answer"]}"))
        .onError((error, stackTrace) =>
            debugPrint("Something went wrong: ${error.toString()}"));
  }

  _postRequest(endpoint, data) {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    return post(url, body: data, headers: uriHeader);
  }

  _getRequest(endpoint) {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    return get(url, headers: uriHeader);
  }

  _putRequest(endpoint, data) {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    return put(url, body: data, headers: uriHeader);
  }

  _patchRequest(endpoint, data) {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    return patch(url, body: data, headers: uriHeader);
  }
}
