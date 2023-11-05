import 'package:shared_preferences/shared_preferences.dart';

class EvaPreferences{

  void setServerUrl(serverUrl) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_url", serverUrl);
  }

  void setServerPort(serverPort) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("server_port", serverPort);
  }

  Future<String?> getServerUrl() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_url") ?? "localhost";
  }

  Future<String?> getServerPort() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString("server_port") ?? "1234";
  }

  String getServerApiUrl() {
    return "${getServerUrl()}:${getServerPort()}";
  }
}
