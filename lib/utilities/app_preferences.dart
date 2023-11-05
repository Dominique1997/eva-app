import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences{

  EvaPreferences(){
    this.sharedPref = await SharedPreferences.getInstance();
  }

  void setServerUrl(serverUrl) async {
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(serverPort) async {
    sharedPref.setString("server_port", serverPort);
  }

  String getServerUrl() {
    return sharedPref.getString("server_url") ?? "localhost";
  }

  String getServerPort() {
    return sharedPref.getString("server_port") ?? "1234";
  }

  String getServerApiUrl() {
    return "${getServerUrl()}:${getServerPort()}";
  }
}
