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
  void initState(){
    super.initState();
    _evaPreference.loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaWidget.widgetMainTitle("EVA SETTINGS", 50),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaWidget.widgetInputField("url", _evaPreference.getServerUrl(), true, false),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaWidget.widgetInputField("port", _evaPreference.getServerPort() , true, false),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
