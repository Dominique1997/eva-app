import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
{
  final EvaWidgets _evaWidget = EvaWidgets();
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(" EVA REGISTER PAGE"),
                  ],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _evaWidget.widgetNavigationIconButton( Icons.logout, "Logout", context)
                ],
              )
            ]
          )
        )
    );
  }
}