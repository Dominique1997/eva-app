import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaSettingsPageWidgets extends EvaBaseWidgets {
  Text pageTitleText() {
    return super.widgetMainTitle("EVA SETTINGS", 50);
  }

  Widget serverURLInputField() {
    return super.widgetInputField("url", true, false);
  }

  Widget serverPortInputField() {
    return super.widgetInputField("port", true, false);
  }

  TextButton saveSettingsTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Save settings", context);
  }

  TextButton resetSettingsTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Reset settings", context);
  }

  TextButton cancelTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Cancel", context);
  }
}