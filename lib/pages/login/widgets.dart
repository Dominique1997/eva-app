import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/pages/register/register.dart';
import 'package:eva_app/pages/settings/settings.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  final EvaActions _evaAction = EvaActions();
  final EvaApi _evaApi = EvaApi();

  IconButton loginIconButton() {
    return IconButton(
        icon: widgetIcon(Icons.login),
        tooltip: "Login",
        onPressed: () => _evaApi.login());
  }

  IconButton registerIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.app_registration_rounded),
        tooltip: "Register",
        onPressed: () => _evaAction.navigateTo(context, const RegisterPage()));
  }

  IconButton settingsIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.settings),
        tooltip: "Settings",
        onPressed: () => _evaAction.navigateTo(context, const SettingsPage()));
  }

  Text pageTitleText() {
    return super.widgetMainTitle("EVA APP", 50);
  }

  Widget serverUsernameInputField() {
    return super.widgetInputField("Username", true, false);
  }

  Widget serverPasswordInputField() {
    return super.widgetInputField("Password", true, true);
  }
}