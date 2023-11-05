import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final EvaRegisterPageWidgets _evaRegisterPageWidget =
      EvaRegisterPageWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_evaRegisterPageWidget.pageTitleText()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_evaRegisterPageWidget.logoutButton(context)],
          )
        ])));
  }
}
