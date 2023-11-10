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

  Future<String?> getServerUrl() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if(sharedPref.containsKey("server_url")){
      return sharedPref.getString("server_url");
    }
    return "localhost";
  }

  Future<String?> getServerPort() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if(sharedPref.containsKey("server_port")){
      return sharedPref.getString("server_port");
    }
    return "localhost";  }

  Future<Uri> getServerApiUrl() async {
    String? serverUrl = await getServerUrl();
    String? serverPort = await getServerPort();
    return Uri(host: serverUrl, port: int.parse(serverPort!));
  }
}
