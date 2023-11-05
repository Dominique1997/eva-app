import 'package:eva_app/utilities/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/pages/register.dart';
import 'package:eva_app/pages/settings.dart';
import 'package:eva_app/utilities/app_actions.dart';

class EvaLoginPageWidgets extends EvaBaseWidgets {
  IconButton loginIconButton() {
    return IconButton(
        icon: widgetIcon(Icons.login),
        tooltip: "Login",
        onPressed: () => _evaAction.login());
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

class EvaHomePageWidgets extends EvaBaseWidgets {
  Text pageTitleText() {
    return super.widgetMainTitle("EVA HOME PAGE", 50);
  }

  TextButton logoutTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Logout", context);
  }
}

class EvaSettingsPageWidgets extends EvaBaseWidgets {
  Text pageTitleText() {
    return super.widgetMainTitle("EVA SETTINGS", 50);
  }

  FutureBuilder<String?> serverURLInputField() {
    return super.widgetInputField("url", true, false);
  }

  FutureBuilder<String?> serverPortInputField() {
    return super.widgetInputField("port", true, false);
  }

  TextButton saveSettingsTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Reset settings", context);
  }

  TextButton resetSettingsTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Reset settings", context);
  }

  TextButton cancelTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Cancel", context);
  }
}

class EvaRegisterPageWidgets extends EvaBaseWidgets {
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

class EvaBaseWidgets {
  final EvaActions _evaAction = EvaActions();

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  TextButton widgetNavigationTextButton(String buttonText, context,
      [navigateToPage]) {
    return TextButton(
        onPressed: () => _evaAction.navigateTo(context, navigateToPage),
        child: Text(buttonText));
  }

  FutureBuilder<String?> widgetInputField(String shownHinttext, bool defaultEnabled, bool hideText){
    return FutureBuilder(
      future: _evaAction.getValue(shownHinttext),
      builder: (context, snapshot){
        return SizedBox(
          width: 500,
          child: TextField(
            controller: TextEditingController(text: snapshot.data),
            decoration: InputDecoration(
              enabled: defaultEnabled,
              border: const OutlineInputBorder(),
              hintText: shownHinttext,
              ),
            onChanged: (text) {
              _evaAction.saveNewValue(shownHinttext, text);
            },
            obscureText: hideText));
        }
    );      
  }

  Future<SizedBox> widgetInputFieldOriginal(
    String shownHinttext, bool defaultEnabled, bool hideText) async {
    String? controllerText = await _evaAction.getValue(shownHinttext);
    return SizedBox(
        width: 500,
        child: TextField(
          controller: TextEditingController(text: controllerText),
          decoration: InputDecoration(
            enabled: defaultEnabled,
            border: const OutlineInputBorder(),
            hintText: shownHinttext,
            ),
          onChanged: (text) {
            _evaAction.saveNewValue(shownHinttext, text);
          },
          obscureText: hideText));
  }

  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }
}
