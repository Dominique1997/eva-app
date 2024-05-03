import 'package:eva_app/pages/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_actions.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_widgets/all_eva_widgets.dart';
import 'package:eva_app/pages/register/registerpage.dart';
import 'package:eva_app/pages/settings/settingspage.dart';

class EvaLoginPageWidgets {
  late EvaActions _evaAction;
  String username = "";
  String password = "";

  EvaLoginPageWidgets(State state) {
    _evaAction = EvaActions();
  }

  WidgetActionIconButton widgetLoginButton(BuildContext context) {
    return WidgetActionIconButton(
      icon: Icons.login,
      hintText: "Login",
      action: () => _evaAction.navigateTo(
        context,
        const HomePage(),
      ),
    );
  }

  WidgetActionIconButton widgetRegisterButton(BuildContext context) {
    return WidgetActionIconButton(
      icon: Icons.app_registration,
      hintText: "Register",
      action: () => _evaAction.navigateTo(
        context,
        const RegisterPage(),
      ),
    );
  }

  WidgetActionIconButton widgetSettingsButton(BuildContext context) {
    return WidgetActionIconButton(
        icon: Icons.settings,
        hintText: "Settings",
        action: () => {
              _evaAction.navigateTo(
                context,
                const SettingsPage(),
              ),
            });
  }

  WidgetMainTitle widgetPageTitle() {
    return const WidgetMainTitle(
      mainTitle: "EVA APP",
      sizeOfText: 50,
    );
  }

  WidgetSizedBox widgetServerUsernameField() {
    return WidgetSizedBox(
      childElement: WidgetTextField(
        shownHinttext: "Username",
        defaultText: "",
        enabled: true,
        obscureText: false,
        onChanged: ((value) => username = value),
        typeOfInput: TextInputType.text,
      ),
    );
  }

  WidgetSizedBox widgetServerPasswordField() {
    return WidgetSizedBox(
      childElement: WidgetTextField(
          shownHinttext: "Password",
          defaultText: "",
          enabled: true,
          obscureText: true,
          onChanged: ((value) => password = value),
          typeOfInput: TextInputType.visiblePassword),
    );
  }
}
