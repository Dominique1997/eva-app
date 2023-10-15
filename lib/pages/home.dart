import 'package:eva_app/pages/login.dart';
import 'package:eva_app/utilities/actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      body:
        Center
        (
          child: widget_iconbutton
          ( Icons.logout, "Logout", navigate_back(context) )
        ) 
    );
  }
}