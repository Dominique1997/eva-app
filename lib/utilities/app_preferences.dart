import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences {
  final _serverIp = TextEditingController(text: "127.0.0.1");
  final _serverPort = TextEditingController(text: "1234");
  final _username = TextEditingController();
  final _password = TextEditingController();

  getServerIp() {
    return _serverIp;
  }

  getServerPort() {
    return _serverPort;
  }

  TextEditingController getServerUsername() {
    return _username;
  }

  TextEditingController getServerPassword() {
    return _password;
  }

  setServerIp(serverIp) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_ip", serverIp);
    _serverIp.text = serverIp;
  }

  setServerPort(serverPort) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
    _serverPort.text = serverPort;
  }

  setServerUsername(username) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_username", username);
    _username.text = username;

  }

  setServerPassword(password) async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_password", password);
    _password.text = password;
  }

  Future loadSettings() async {
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if (sharedPref.getString("serverIp") != null) {
      setServerIp(sharedPref.getString("serverIp"));
    }
  }
}
