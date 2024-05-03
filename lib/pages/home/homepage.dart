import 'package:flutter/material.dart';
import 'package:eva_app/pages/home/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late EvaHomePageWidgets _evaHomePageWidget;

  @override
  void initState() {
    super.initState();
    _evaHomePageWidget = EvaHomePageWidgets();
  }

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
              _evaHomePageWidget.widgetPageTitle(),
            ],
          ),
          Expanded(
            child: _evaHomePageWidget.widgetChatHistoryListView(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _evaHomePageWidget.widgetCommandInputField(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _evaHomePageWidget.widgetSendCommandButton(),
              _evaHomePageWidget.widgetLogoutButton(context),
              _evaHomePageWidget.widgetTestButton()
            ],
          )
        ],
      ),
    ));
  }
}
