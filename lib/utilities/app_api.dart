import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_values.dart';
import 'package:http/http.dart' show Response, get, patch, post, put;

class EvaApi {
  late String apiUrl;
  late int apiPort;
  late EvaActions _evaAction;
  late EvaAppValues _evaAppValues;
  late Map<String, String> uriHeader;

  EvaApi() {
    _evaAppValues = EvaAppValues();
    _evaAction = EvaActions();
    _evaAppValues.getServerPort().then((value) => apiPort = int.parse(value));
    _evaAppValues.getServerUrl().then((value) => apiUrl = value);
    uriHeader = {'Content-Type': 'application/json'};
  }

  Future testApi(String testIP, String testPort) async {
    try {
      Uri webUrl = Uri(
          scheme: "http",
          host: testIP,
          port: int.parse(testPort),
          path: "/api/status");
      Response apiResponse = await get(webUrl);
      return jsonDecode(apiResponse.body)["api_state"];
    } catch (e) {
      return false;
    }
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

  Future<Response> _postRequest(endpoint, data) async {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    try {
      return await post(url, body: data, headers: uriHeader);
    } catch (e) {
      _evaAction.exceptionChecker(e);
      rethrow;
    }
  }

  Future<Response> _getRequest(endpoint) async {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    try {
      return await get(url, headers: uriHeader);
    } catch (e) {
      _evaAction.exceptionChecker(e);
      rethrow;
    }
  }

  Future<Response> _putRequest(endpoint, data) async {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    try {
      return await put(url, body: data, headers: uriHeader);
    } catch (e) {
      _evaAction.exceptionChecker(e);
      rethrow;
    }
  }

  Future<Response> _patchRequest(endpoint, data) async {
    Uri url = Uri(scheme: "http", host: apiUrl, port: apiPort, path: endpoint);
    try {
      return await patch(url, body: data, headers: uriHeader);
    } catch (e) {
      _evaAction.exceptionChecker(e);
      rethrow;
    }
  }
}
