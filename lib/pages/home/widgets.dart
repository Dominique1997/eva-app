import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  late EvaApi _evaApi;
  String question = "";

  EvaHomePageWidgets() {
    _evaApi = EvaApi();
  }

  Widget widgetPageTitle() {
    return widgetMainTitle("EVA HOME PAGE", 50);
  }

  Widget widgetLogoutButton(BuildContext context) {
    return widgetNavigationIconButton(Icons.logout, "Logout", context);
  }

  Widget widgetCommandInputField() {
    SizedBox inputSizedBox = widgetSizedBox(widgetTextField("Question", true,
        false, ((value) => question = value), TextInputType.text));
    return inputSizedBox;
  }

  Widget widgetSendCommandButton() {
    return widgetActionIconButton(
        Icons.send, "Send question", () => _evaApi.checkCommand("hello"));
  }

  Widget widgetTestButton() {
    return widgetActionIconButton(Icons.question_mark, "Test button",
        () => debugPrint("Hi i am a test button"));
  }
}
