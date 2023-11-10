import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';

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

Widget widgetInputField(shownHinttext, enabled, obscureText){
  return FutureBuilder<String?>(
    future: _evaAction.getValue(shownHinttext),
    builder: (context, snapshot) {
        return SizedBox(
          width: 500,
          child: TextField(
            controller: TextEditingController(text: snapshot.data),
            decoration: InputDecoration(
              enabled: enabled,
              border: const OutlineInputBorder(),
              hintText: shownHinttext,
            ),
            onChanged: (newValue) {
              _evaAction.saveNewValue(shownHinttext, newValue);
            },
            obscureText: obscureText,
          ),
        );
      }
      );
  }


  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }

}
