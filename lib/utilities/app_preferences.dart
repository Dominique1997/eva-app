import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences {
  final TextEditingController _server_username = TextEditingController();
  final TextEditingController _server_password = TextEditingController();
  final TextEditingController _server_url = TextEditingController();
  final TextEditingController _server_port = TextEditingController();


  void setServerUrl(serverUrl) async {
    _server_url.text = serverUrl;
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(serverPort) async {
    _server_port.text = serverPort;
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
  }

  void setServerUsername(username) async {
    _server_username.text = username;
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_username", username);
  }

  void setServerPassword(password) async {
    _server_password.text = password;
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_password", password);
  }

  TextEditingController getServerUrl(){
    return _server_url;
  }

  TextEditingController getServerPort(){
    return _server_port;
  }

  TextEditingController getServerUsername(){
    return _server_username;
  }

  TextEditingController getServerPassword(){
    return _server_password;
  }

  void loadSettings() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _server_url.text = sharedPref.getString("server_url") ?? "localhost";
    _server_port.text = sharedPref.getString("server_port")?? "1234";
    _server_username.text = sharedPref.getString("server_username") ?? "";
    _server_password.text = sharedPref.getString("server_password") ?? "";
  }
}
