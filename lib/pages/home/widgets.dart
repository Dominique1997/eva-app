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

  Widget widgetPageTitle() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  Widget widgetLogoutButton(BuildContext context) {
    return super.widgetNavigationIconButton(Icons.logout, "Logout", context);
  }

  Widget widgetCommandInputField() {
    SizedBox inputSizedBox = super.widgetSizedBox(super.widgetTextField(
        "Question",
        true,
        false,
        ((value) => question = value),
        TextInputType.text));
    return inputSizedBox;
  }

  Widget widgetSendCommandButton() {
    return super.widgetActionIconButton(
        Icons.send, "Send question", () => _evaApi.checkCommand("hello"));
  }

  Widget widgetTestButton() {
    return super.widgetActionIconButton(Icons.question_mark, "Test button",
        () => debugPrint("Hi i am a test button"));
  }
}
