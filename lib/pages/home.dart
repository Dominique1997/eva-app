import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EvaHomePageWidgets _evaHomePageWidget = EvaHomePageWidgets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _evaHomePageWidget.pageTitleText(),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_evaHomePageWidget.logoutTextButton(context)])
        ])));
  }
}
