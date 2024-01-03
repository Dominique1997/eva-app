import 'package:flutter/material.dart';
import 'package:eva_app/pages/settings/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final EvaSettingsPageWidgets _evaSettingsPageWidget =
      EvaSettingsPageWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_evaSettingsPageWidget.pageTitle()],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaSettingsPageWidget.widgetTextLable("Server IP/URL"),
              _evaSettingsPageWidget.widgetServerURLField()
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaSettingsPageWidget.widgetTextLable("Server port"),
              _evaSettingsPageWidget.widgetServerPortField(),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaSettingsPageWidget.widgetTextLable("Language"),
                _evaSettingsPageWidget.widgetAvailableLanguagesDropDown()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaSettingsPageWidget.widgetSaveSettingsButton(),
                _evaSettingsPageWidget.widgetResetSettingsButton(),
                _evaSettingsPageWidget.widgetCancelButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }
}
