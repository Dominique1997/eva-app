import 'package:eva_app/pages/home/homepage.dart';
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

  Widget widgetLoginButton(BuildContext context) {
    return super.widgetActionIconButton(Icons.login, "Login",
        () => _evaAction.navigateTo(context, const HomePage()));
  }

  Widget widgetRegisterButton(BuildContext context) {
    return super.widgetActionIconButton(Icons.app_registration, "Register",
        () => _evaAction.navigateTo(context, const RegisterPage()));
  }

  Widget widgetSettingsButton(BuildContext context) {
    return super.widgetActionIconButton(Icons.settings, "Settings",
        () => _evaAction.navigateTo(context, const SettingsPage()));
  }

  Widget widgetPageTitle() {
    return super.widgetMainTitle("EVA APP", 50);
  }

  SizedBox widgetServerUsernameField() {
    return super.widgetSizedBox(super.widgetTextField(
      "Username",
      true,
      false,
      ((value) => username = value),
      TextInputType.text,
    ));
  }

  SizedBox widgetServerPasswordField() {
    return super.widgetSizedBox(super.widgetTextField("Password", true, true,
        ((value) => password = value), TextInputType.visiblePassword));
    ;
  }
}
