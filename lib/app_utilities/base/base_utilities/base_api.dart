import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:eva_app/app_utilities/base/base_utilities/base_values.dart';
import 'package:http/http.dart' show Response, get, patch, post, put;

class BaseApi {
  final BaseValues appValue = BaseValues();
  int serverPort = 9999;
  String serverIP = "localhost";

  BaseApi() {
    appValue.getServerUrl().then((value) => serverIP = value);
    appValue.getServerPort().then((value) => serverPort = int.parse(value));
  }

  Uri _getUri(String endpoint, [Map<String, dynamic>? queryParam]) {
    return Uri(
        scheme: "http",
        host: serverIP,
        port: serverPort,
        path: endpoint,
        queryParameters: queryParam);
  }

  _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  postRequest(String endpoint, [Map<String, dynamic>? queryParam]) async {
    return await post(
      _getUri(endpoint),
      body: jsonEncode(queryParam),
    )
        .then(
          (value) => _handleResponse(value),
        )
        .onError(
          (error, stackTrace) => debugPrint(
            error.toString(),
          ),
        );
  }

  getRequest(String endpoint, [Map<String, dynamic>? queryParam]) async {
    return await get(_getUri(endpoint, queryParam))
        .then(
          (value) => _handleResponse(value),
        )
        .onError(
          (error, stackTrace) => debugPrint(
            error.toString(),
          ),
        );
  }

  putRequest(String endpoint, Map<String, dynamic> queryParam) async {
    return await put(_getUri(endpoint), body: jsonEncode(queryParam))
        .then(
          (value) => _handleResponse(value),
        )
        .onError(
          (error, stackTrace) => debugPrint(
            error.toString(),
          ),
        );
  }

  patchRequest(String endpoint, Map<String, dynamic> queryParam) async {
    return await patch(_getUri(endpoint), body: jsonEncode(queryParam))
        .then(
          (value) => _handleResponse(value),
        )
        .onError(
          (error, stackTrace) => debugPrint(
            error.toString(),
          ),
        );
  }
}
