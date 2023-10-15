import 'package:eva_app/pages/login.dart';
import 'package:eva_app/utilities/actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/widgets.dart';

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
          widget_iconbutton
          ( Icons.logout, "Logout", navigate_back(context))
        )
    );
  }
}