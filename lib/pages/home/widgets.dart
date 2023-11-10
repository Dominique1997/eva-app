import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  Text pageTitleText() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  TextButton logoutTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Logout", context);
  }
}