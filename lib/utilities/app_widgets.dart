import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';

var _evaNav = EvaActions();

Widget widgetIcon(IconData icon){
  return Icon(icon);
}

Widget widgetInputField(String shownHinttext, TextEditingController defaultText, bool defaultEnabled){
  return SizedBox(
    width: 500,
    child:
    TextField
    (
      controller: defaultText,
      decoration: InputDecoration(
        enabled: defaultEnabled,
        border: const OutlineInputBorder(),
        hintText: shownHinttext,
      ),
    )
  );
}

Widget widgetIconButton(IconData icon, String buttonText, orignalPage, [forwardedPage]){
  return IconButton(
    icon: widgetIcon(icon),
    tooltip: buttonText,
    color: Colors.black,    
    onPressed: ()
    {
      if(forwardedPage != null)
      {
        _evaNav.navigateTo(orignalPage, forwardedPage);
      }
      else
      {
        _evaNav.navigateBack(orignalPage);
      }
    }
  );
}

Widget widgetMainTitle(String mainTitle, double sizeOfText){
    return Text(
      mainTitle,
      style: TextStyle(fontSize: sizeOfText));
}

Widget widgetTextButton(String buttonText, action){
  return TextButton(
    onPressed: () => print(action),
    child: Text(buttonText)
    );
}
