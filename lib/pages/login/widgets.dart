import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/utilities/app_values.dart';
import 'package:eva_app/pages/register/registerpage.dart';
import 'package:eva_app/pages/settings/settingspage.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;
  late EvaAppValues _evaAppValues;
  late EvaApi _evaApi;

  EvaLoginPageWidgets() {
    _evaAction = EvaActions();
    _evaAppValues = EvaAppValues();
    _evaApi = EvaApi();
  }

  IconButton widgetLoginIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.login),
        tooltip: "login",
        onPressed: () => _evaApi.login(context));
    //onPressed: () => _evaAction.navigateTo(context, const HomePage()));
  }

  IconButton widgetRegisterIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.app_registration_rounded),
        tooltip: "Register",
        onPressed: () => _evaAction.navigateTo(context, const RegisterPage()));
  }

  IconButton widgetSettingsIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.settings),
        tooltip: "Settings",
        onPressed: () => _evaAction.navigateTo(context, const SettingsPage()));
  }

  Text widgetPageTitleText() {
    return super.widgetMainTitle("EVA APP", 50);
  }

  SizedBox widgetServerUsernameInputField() {
    TextField serverUsernameInputField = super.widgetTextField(
      "Username",
      true,
      false,
      ((value) => _evaAppValues.setServerUsername(value)),
      TextInputType.text,
    );
    SizedBox serverUsernameSizedBox =
        super.widgetSizedBox(serverUsernameInputField);
    return serverUsernameSizedBox;
  }

  SizedBox widgetServerPasswordInputField() {
    TextField serverPasswordInputField = super.widgetTextField(
        "Password", true, true, ((value) => {}), TextInputType.visiblePassword);
    SizedBox serverPasswordSizedBox =
        super.widgetSizedBox(serverPasswordInputField);
    return serverPasswordSizedBox;
  }
}
