import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences{

  void setServerUrl(serverUrl) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(serverPort) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
  }

  Future<String> getServerUrl() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_url") ?? "localhost";
  }

  Future<String> getServerPort() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_port") ?? "1234";
  }

  Uri getServerApiUrl() {
    return Uri(host: getServerUrl() as String, port: getServerPort() as int);
  }
}
