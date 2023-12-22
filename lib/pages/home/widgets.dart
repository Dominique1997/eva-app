import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_actions.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  final EvaApi _evaApi = EvaApi();
  final EvaActions _evaAction = EvaActions();

  Text pageTitleText() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  TextButton logoutTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Logout", context);
  }

  Widget inputTextField() {
    return super.widgetInputField("Question", true, false);
  }

  Widget sendCommand() {
    var commandText = _evaAction.getValue("Question");
    return super
        .widgetActionTextButton("Send command", _evaApi.checkCommand("hi"));
  }
}
