import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

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
          children: [_evaLoginPageWidget.pageTitleText()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.serverUsernameInputField(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_evaLoginPageWidget.serverPasswordInputField()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.loginIconButton(),
            _evaLoginPageWidget.registerIconButton(context),
            _evaLoginPageWidget.settingsIconButton(context)
          ],
        ),
      ]),
    ));
  }
}
