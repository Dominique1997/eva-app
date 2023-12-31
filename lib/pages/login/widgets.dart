import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/pages/register/registerpage.dart';
import 'package:eva_app/pages/settings/settingspage.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;
  late EvaApi _evaApi;
  late String username;
  late String password;

  EvaLoginPageWidgets() {
    _evaAction = EvaActions();
    _evaApi = EvaApi();
    username = "";
    password = "";
  }

  IconButton widgetLoginButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.login),
        tooltip: "login",
        onPressed: () => _evaApi.login(context));
  }

  IconButton widgetRegisterButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.app_registration),
        tooltip: "Register",
        onPressed: () => _evaAction.navigateTo(context, const RegisterPage()));
  }

  IconButton widgetSettingsButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.settings),
        tooltip: "Settings",
        onPressed: () => _evaAction.navigateTo(context, const SettingsPage()));
  }

  Text widgetPageTitle() {
    return super.widgetMainTitle("EVA APP", 50);
  }

  SizedBox widgetServerUsernameField() {
    TextField serverUsernameInputField = super.widgetTextField(
      "Username",
      true,
      false,
      ((value) => username = value),
      TextInputType.text,
    );
    SizedBox serverUsernameSizedBox =
        super.widgetSizedBox(serverUsernameInputField);
    return serverUsernameSizedBox;
  }

  SizedBox widgetServerPasswordField() {
    TextField serverPasswordInputField = super.widgetTextField("Password", true,
        true, ((value) => password = value), TextInputType.visiblePassword);
    SizedBox serverPasswordSizedBox =
        super.widgetSizedBox(serverPasswordInputField);
    return serverPasswordSizedBox;
  }
}
