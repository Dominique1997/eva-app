import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  late EvaApi _evaApi;
  late String question;

  EvaHomePageWidgets() {
    _evaApi = EvaApi();
    question = "";
  }

  Text widgetPageTitle() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  IconButton widgetLogoutButton(BuildContext context) {
    return super.widgetNavigationIconButton(Icons.logout, "Logout", context);
  }

  SizedBox widgetCommandInputField() {
    TextField inputTextField = super.widgetTextField("Question", true, false,
        ((value) => question = value), TextInputType.text);
    SizedBox inputSizedBox = super.widgetSizedBox(inputTextField);
    return inputSizedBox;
  }

  IconButton widgetSendCommandButton() {
    return super.widgetActionIconButton(
        Icons.send, "Send command", () => _evaApi.checkCommand("hello"));
  }

  IconButton widgetTestButton() {
    return super.widgetActionIconButton(Icons.question_mark, "Test button",
        () => debugPrint("Hi i am a test button"));
  }
}
