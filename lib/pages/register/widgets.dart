import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_widgets/all_eva_widgets.dart';

class EvaRegisterPageWidgets {
  late EvaActions evaActions = EvaActions();
  String registerUsername = "";
  String registerPassword = "";

  WidgetMainTitle widgetPageTitle() {
    return const WidgetMainTitle(
        mainTitle: "EVA REGISTER PAGE", sizeOfText: 50);
  }

  WidgetActionIconButton widgetLogoutButton(BuildContext context) {
    return WidgetActionIconButton(
      icon: Icons.logout,
      hintText: "Logout",
      action: () => evaActions.navigateTo(context),
    );
  }

  WidgetSizedBox widgetRegisterUsernameField() {
    return WidgetSizedBox(
      childElement: WidgetTextField(
        shownHinttext: "Username",
        defaultText: "Username",
        enabled: true,
        obscureText: false,
        onChanged: (value) {
          registerUsername = value;
        },
        typeOfInput: TextInputType.text,
      ),
    );
  }

  WidgetSizedBox widgetRegisterPasswordField() {
    return WidgetSizedBox(
      childElement: WidgetTextField(
        shownHinttext: "Password",
        defaultText: "Password",
        enabled: true,
        obscureText: false,
        onChanged: (value) {
          registerPassword = value;
        },
        typeOfInput: TextInputType.text,
      ),
    );
  }

  WidgetActionIconButton widgetSaveRegistrationButton() {
    return WidgetActionIconButton(
      icon: Icons.save,
      hintText: "Register",
      action: () => debugPrint("Registration is done"),
    );
  }

  WidgetActionIconButton widgetResetRegistrationButton() {
    return WidgetActionIconButton(
      icon: Icons.restore_page,
      hintText: "Reset registration form",
      action: () => debugPrint("Registration form is reset"),
    );
  }
}
