import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final EvaPreferences _evaPreference = EvaPreferences();
  final EvaWidgets _evaWidget = EvaWidgets();
  @override
  Widget build(BuildContext context){
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
                    _evaWidget.widgetMainTitle("EVA SETTINGS", 50),
                    ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _evaWidget.widgetInputField("server url", _evaPreference.getServerIp(), true),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _evaWidget.widgetInputField("server port", _evaPreference.getServerPort(), true),
                  ]
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _evaWidget.widgetNavigationTextButton("Save settings", context),
                    _evaWidget.widgetNavigationTextButton("Reset settings", context),
                    _evaWidget.widgetNavigationTextButton("Cancel", context)
                  ],
                )
              ],
            ),
        ),      
    );
  }
}