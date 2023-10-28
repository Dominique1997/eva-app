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
  EvaPreferences evaPref = EvaPreferences();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body: 
        Center
        (
          child:
          Column
          (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  widgetMainTitle("EVA APP", 50)
                ],
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  widgetInputField("Username", evaPref.getServerUsername(), true),
                ],
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                  widgetInputField("Password", evaPref.getServerPassword(), true),
                ],
              ),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  widgetIconButton(Icons.login, "Login", context, const HomePage()) ,
                  widgetIconButton(Icons.app_registration_rounded, "Register", context, const Register()),
                  widgetIconButton(Icons.settings, "Settings", context, const SettingsPage())
                ],
              )
            ]
          ),
        )
    );
  }
}