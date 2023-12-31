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
          children: [_evaLoginPageWidget.widgetPageTitle()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.widgetServerUsernameField(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_evaLoginPageWidget.widgetServerPasswordField()],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaLoginPageWidget.widgetLoginButton(context),
            _evaLoginPageWidget.widgetRegisterButton(context),
            _evaLoginPageWidget.widgetSettingsButton(context)
          ],
        ),
      ]),
    ));
  }
}
