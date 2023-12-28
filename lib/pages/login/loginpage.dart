import 'package:flutter/material.dart';
import 'package:eva_app/pages/login/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

void initState() {}

class _LoginPageState extends State<LoginPage> {
  final EvaLoginPageWidgets _evaLoginPageWidget = EvaLoginPageWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_evaLoginPageWidget.widgetPageTitleText()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.widgetServerUsernameInputField(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_evaLoginPageWidget.widgetServerPasswordInputField()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.widgetLoginIconButton(context),
            _evaLoginPageWidget.widgetRegisterIconButton(context),
            _evaLoginPageWidget.widgetSettingsIconButton(context)
          ],
        ),
      ]),
    ));
  }
}
