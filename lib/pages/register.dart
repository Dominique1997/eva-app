import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
{
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
                  widgetIconButton( Icons.logout, "Logout", context)
                ],
              )
            ]
          )
        )
    );
  }
}