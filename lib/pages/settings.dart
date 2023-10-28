import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  EvaPreferences evaPref = EvaPreferences();
  @override
  Widget build(BuildContext context){
    TextEditingController server_ip = evaPref.getServerIp();
    //TextEditingController server_port = await evaPref.getServerPort();
    //TextEditingController server_ip = TextEditingController(text: "127.0.0.1");
    TextEditingController server_port = TextEditingController(text: "1234");
    return Scaffold(
      body:
        Center(
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetMainTitle("EVA SETTINGS", 50),
                    ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetInputField("server url", server_ip, true),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetInputField("server port", server_port, true),
                  ]
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetTextButton("Save settings", "Settings saved"),
                    widgetTextButton("Reset settings", "Resetting the settings"),
                    widgetTextButton("Cancel", "Settings are cancelled")
                  ],
                )
              ],
            ),
        ),      
    );
  }
}