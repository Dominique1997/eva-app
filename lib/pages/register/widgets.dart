import 'package:eva_app/utilities/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaRegisterPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;
  String registerUsername = "";
  String registerPassword = "";

  EvaRegisterPageWidgets() {
    _evaAction = EvaActions();
  }

  Widget widgetPageTitle() {
    return widgetMainTitle("EVA REGISTER PAGE", 50);
  }

  Widget widgetLogoutButton(BuildContext context) {
    return widgetActionIconButton(
        Icons.logout, "Logout", () => _evaAction.navigateTo(context));
  }

  Widget widgetRegisterUsernameField() {
    return widgetSizedBox(widgetTextField("Username", true, false, (value) {
      registerUsername = value;
    }, TextInputType.text));
  }

  Widget widgetRegisterPasswordField() {
    return widgetSizedBox(widgetTextField("Password", true, false, (value) {
      registerPassword = value;
    }, TextInputType.text));
  }

  Widget widgetSaveRegistrationButton() {
    return widgetActionIconButton(
        Icons.save, "Register", () => debugPrint("Registration is done"));
  }

  Widget widgetResetRegistrationButton() {
    return widgetActionIconButton(Icons.restore_page, "Reset registration form",
        () => debugPrint("Registration form is reset"));
  }
}
