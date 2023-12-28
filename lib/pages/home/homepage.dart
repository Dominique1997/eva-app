import 'package:flutter/material.dart';
import 'package:eva_app/pages/home/widgets.dart';

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
              children: [_evaHomePageWidget.widgetPageTitleText()]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_evaHomePageWidget.widgetInputTextField()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _evaHomePageWidget.widgetSendCommandButton(),
              _evaHomePageWidget.widgetLogoutTextButton(context),
              _evaHomePageWidget.widgetTestButton()
            ],
          )
        ],
      ),
    ));
  }
}