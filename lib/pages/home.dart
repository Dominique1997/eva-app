import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_preferences.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  final EvaPreferences _evaPreference = EvaPreferences();
  final EvaActions _evaAction = EvaActions();  @override
  Widget build(BuildContext context)
  {
    _evaPreference.loadSettings();
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" EVA HOME PAGE "),
                  ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                widgetIconButton( Icons.logout, "Logout", _evaAction.navigateTo(context))
                ]
              )
            ]
          )
        )
    );
  }
}