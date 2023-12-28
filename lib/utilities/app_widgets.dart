import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/translations.dart';

class EvaBaseWidgets {
  late EvaActions _evaAction;

  EvaBaseWidgets() {
    _evaAction = EvaActions();
  }

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  TextButton widgetNavigationTextButton(String buttonText, context,
      [navigateToPage]) {
    return TextButton(
        onPressed: () => _evaAction.navigateTo(context, navigateToPage),
        child: Text(buttonText));
  }

  TextButton widgetActionTextButton(String buttonText, [action]) {
    return TextButton(onPressed: action, child: Text(buttonText));
  }

  SizedBox widgetSizedBox([childElement = Widget]) {
    return SizedBox(
      width: 500,
      child: childElement,
    );
  }

  TextField widgetTextField(
      String shownHinttext,
      bool enabled,
      bool obscureText,
      ValueChanged<String> onChanged,
      TextInputType typeOfInput,
      [defaultText]) {
    return TextField(
      controller: TextEditingController(text: defaultText ?? ""),
      decoration: InputDecoration(
        enabled: enabled,
        border: const OutlineInputBorder(),
        hintText: shownHinttext,
      ),
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: typeOfInput,
    );
  }

  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    Translations.findTranslation("Login", "Nederlands")
        .then((value) => debugPrint(value));
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }
}
