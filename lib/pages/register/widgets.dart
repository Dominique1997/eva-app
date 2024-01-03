import 'package:eva_app/utilities/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaRegisterPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;

  EvaRegisterPageWidgets() {
    _evaAction = EvaActions();
  }

  Widget widgetPageTitle() {
    return super.widgetMainTitle("EVA REGISTER PAGE", 50);
  }

  Widget widgetLogoutButton(BuildContext context) {
    return widgetActionIconButton(
        Icons.logout, "Logout", () => _evaAction.navigateTo(context));
  }
}
