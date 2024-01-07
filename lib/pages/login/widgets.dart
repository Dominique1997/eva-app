import 'package:eva_app/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/app_widgets.dart';
import 'package:eva_app/pages/register/registerpage.dart';
import 'package:eva_app/pages/settings/settingspage.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;
  String username = "";
  String password = "";

  EvaLoginPageWidgets() {
    _evaAction = EvaActions();
  }

  Widget widgetLoginButton(BuildContext context) {
    return widgetActionIconButton(Icons.login, "Login",
        () => _evaAction.navigateTo(context, const HomePage()));
  }

  Widget widgetRegisterButton(BuildContext context) {
    return widgetActionIconButton(Icons.app_registration, "Register",
        () => _evaAction.navigateTo(context, const RegisterPage()));
  }

  Widget widgetSettingsButton(BuildContext context) {
    return widgetActionIconButton(Icons.settings, "Settings",
        () => _evaAction.navigateTo(context, const SettingsPage()));
  }

  Widget widgetPageTitle() {
    return widgetMainTitle("EVA APP", 50);
  }

  SizedBox widgetServerUsernameField() {
    return widgetSizedBox(widgetTextField(
      "Username",
      true,
      false,
      ((value) => username = value),
      TextInputType.text,
    ));
  }

  SizedBox widgetServerPasswordField() {
    return widgetSizedBox(widgetTextField("Password", true, true,
        ((value) => password = value), TextInputType.visiblePassword));
  }
}
