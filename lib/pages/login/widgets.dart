import 'package:eva_app/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/pages/register/registerpage.dart';
import 'package:eva_app/pages/settings/settingspage.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  final EvaActions _evaAction = EvaActions();

  IconButton loginIconButton(BuildContext context) {
    return IconButton(
        icon: widgetIcon(Icons.login),
        tooltip: "login",
        //onPressed: () => _evaApi.login());
        onPressed: () => _evaAction.navigateTo(context, const HomePage()));
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
