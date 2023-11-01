import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';

class EvaWidgets {
  final EvaActions _evaAction = EvaActions();

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  SizedBox widgetInputField(String shownHinttext,
      TextEditingController textEditingController, bool defaultEnabled, bool hideText) {
    return SizedBox(
        width: 500,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            enabled: defaultEnabled,
            border: const OutlineInputBorder(),
            hintText: shownHinttext,
          ),
          onChanged: (text) {_evaAction.saveNewValue(shownHinttext, text);},
          obscureText: hideText
        ));
  }

  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }

  TextButton widgetNavigationTextButton(String buttonText, context,
      [navigateToPage]) {
    return TextButton(
        onPressed: () => _evaAction.navigateTo(context, navigateToPage),
        child: Text(buttonText));
  }

  IconButton widgetNavigationIconButton(
      IconData icon, String buttonText, context,
      [navigateToPage]) {
    return IconButton(
        icon: widgetIcon(icon),
        tooltip: buttonText,
        color: Colors.black,
        onPressed: () => _evaAction.navigateTo(context, navigateToPage));
  }
}
