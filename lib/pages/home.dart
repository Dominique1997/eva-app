import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

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
                widgetIconButton( Icons.logout, "Logout", context)
                ]
              )
            ]
          )
        )
    );
  }
}