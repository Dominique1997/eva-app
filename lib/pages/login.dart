import 'package:eva_app/pages/register.dart';
import 'package:eva_app/utilities/actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/widgets.dart';
import 'package:eva_app/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  widget_main_title( "EVA APP", 50 )
                ],
              ),
              widget_inputField( "Username", username, true ),
              widget_inputField( "Password", password, true ),
              Row
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  widget_iconbutton( Icons.login, "Login", navigate_to(context, HomePage())) ,
                  //widget_iconbutton( Icons.app_registration_rounded, "Register", navigate_to(context, Register()) ),
                ],
              )
            ]
          ),
        )
    );
  }
}