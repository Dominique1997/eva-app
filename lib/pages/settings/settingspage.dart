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
              children: [_evaSettingsPageWidget.pageTitleText()],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_evaSettingsPageWidget.widgetServerURLTextField()]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _evaSettingsPageWidget.widgetServerPortTextField(),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _evaSettingsPageWidget.widgetSaveSettingsTextButton(),
                _evaSettingsPageWidget.widgetResetSettingsTextButton(),
                _evaSettingsPageWidget.widgetCancelTextButton(context)
              ],
            )
          ],
        ),
      ),
    );
  }
}
