import 'package:eva_app/utilities/app_actions.dart';
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
  final EvaActions _evaAction = EvaActions();
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
                    widgetMainTitle("EVA SETTINGS", 50),
                    ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetInputField("server url", _evaPreference.getServerIp(), true),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetInputField("server port", _evaPreference.getServerPort(), true),
                  ]
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widgetTextButton("Save settings", _evaAction.navigateTo(context)),
                    widgetTextButton("Reset settings", _evaAction.navigateTo(context)),
                    widgetTextButton("Cancel", _evaAction.navigateTo(context))
                  ],
                )
              ],
            ),
        ),      
    );
  }
}