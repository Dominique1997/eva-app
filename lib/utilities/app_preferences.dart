import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences{
  final _serverIp = TextEditingController(text: "127.0.0.1");
  final _serverPort = TextEditingController(text: "1234");
  final _username = TextEditingController();
  final _password = TextEditingController();


  getServerIp(){
    return _serverIp;
  }

  getServerPort(){
    return _serverPort;
  }



  Future<TextEditingController> orig_getServerIp() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? serverIp = sharedPref.getString("server_ip");
    if(serverIp == null){
      return TextEditingController(text: "127.0.0.1");
    }
    return _serverIp;
  }

  Future<TextEditingController> orig_getServerPort() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? serverPort = sharedPref.getString("server_port");
    if(serverPort == null){
      return TextEditingController(text: "1234");
    }
      return _serverPort;
  }

  TextEditingController getServerUsername(){
    return _username;
  }

  TextEditingController getServerPassword(){
    return _password;
  }

  setServerIp(serverIp) async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_ip", serverIp);
    _serverIp.text = serverIp;
  }

  setServerPort(serverPort) async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
    _serverPort.text = serverPort;
  }

  setServerUsername(username){
    _username.text = username;
  }

  setServerPassword(password){
    _password.text = password;
  }
}