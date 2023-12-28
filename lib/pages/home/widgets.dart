import 'package:eva_app/utilities/app_values.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  late EvaApi _evaApi;
  late EvaAppValues _evaAppValues;

  EvaHomePageWidgets() {
    _evaApi = EvaApi();
    _evaAppValues = EvaAppValues();
  }

  Text widgetPageTitleText() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  TextButton widgetLogoutTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Logout", context);
  }

  SizedBox widgetInputTextField() {
    TextField inputTextField = super.widgetTextField("Question", true, false,
        ((value) => _evaAppValues.setQuestion(value)), TextInputType.text);
    SizedBox inputSizedBox = super.widgetSizedBox(inputTextField);
    return inputSizedBox;
  }

  TextButton widgetSendCommandButton() {
    TextButton checkCommandButton = super.widgetActionTextButton(
        "Send command", () => _evaApi.checkCommand("hello"));
    return checkCommandButton;
  }

  TextButton widgetTestButton() {
    return super.widgetActionTextButton(
        "Test button", () => print("HI i am a test button"));
  }
}
