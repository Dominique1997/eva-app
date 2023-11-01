import 'package:flutter/material.dart';
import 'package:eva_app/pages/home.dart';
import 'package:eva_app/pages/settings.dart';
import 'package:eva_app/pages/register.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final EvaPreferences _evaPreference = EvaPreferences();
  final EvaWidgets _evaWidget = EvaWidgets();

  @override
  void initState(){
    super.initState();
    _evaPreference.loadSettings();
  }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        body: Center(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_evaWidget.widgetMainTitle("EVA APP", 50)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaWidget.widgetInputField("Username", _evaPreference.getServerUsername(), true, false),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaWidget.widgetInputField("Password",
               _evaPreference.getServerPassword(), true, true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _evaWidget.widgetNavigationIconButton(
                Icons.login, "Login", context, const HomePage()),
            _evaWidget.widgetNavigationIconButton(
                Icons.app_registration_rounded,
                "Register",
                context,
                const RegisterPage()),
            _evaWidget.widgetNavigationIconButton(
                Icons.settings, "Settings", context, const SettingsPage())
          ],
        ),
      ]),
    ));
  }
}
