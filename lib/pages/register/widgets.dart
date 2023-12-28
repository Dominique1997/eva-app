import 'package:eva_app/utilities/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaRegisterPageWidgets extends EvaBaseWidgets {
  late EvaActions _evaAction;

  EvaRegisterPageWidgets() {
    _evaAction = EvaActions();
  }

  Text widgetPageTitleText() {
    return super.widgetMainTitle("EVA REGISTER PAGE", 50);
  }

  IconButton widgetLogoutButton(BuildContext context) {
    return IconButton(
      onPressed: () => _evaAction.navigateTo(context),
      icon: widgetIcon(Icons.logout),
      tooltip: "Logout",
    );
  }
}
