import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

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
              children: [_evaSettingsPageWidget.pageTitleText()],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_evaSettingsPageWidget.serverURLInputField()]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaSettingsPageWidget.serverPortInputField(),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaSettingsPageWidget.resetSettingsTextButton(context),
                _evaSettingsPageWidget.cancelTextButton(context)
              ],
            )
          ],
        ),
      ),
    );
  }
}
