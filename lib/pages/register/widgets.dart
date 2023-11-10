import 'package:eva_app/utilities/app_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaRegisterPageWidgets extends EvaBaseWidgets {
  final EvaActions _evaAction = EvaActions();
  Text pageTitleText() {
    return super.widgetMainTitle("EVA REGISTER PAGE", 50);
  }

  IconButton logoutButton(BuildContext context) {
    return IconButton(
      onPressed: () => _evaAction.navigateTo(context),
      icon: widgetIcon(Icons.logout),
      tooltip: "Logout",
    );
  }
}