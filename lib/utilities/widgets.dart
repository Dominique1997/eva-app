import 'package:flutter/material.dart';
import 'package:eva_app/utilities/actions.dart';

var username = TextEditingController();
var password = TextEditingController();

Widget widget_icon(IconData icon){
  return Icon(icon);
}

Widget widget_inputField(String shownHinttext, TextEditingController textController, bool defaultEnabled){
  return SizedBox(
    width: 500,
    child:
    TextField
    (
      controller: textController,
      decoration: InputDecoration(
        enabled: defaultEnabled,
        border: const OutlineInputBorder(),
        hintText: shownHinttext
      ),
    )
  );
}

Widget widget_iconbutton(IconData icon, String buttonText, action){
  return IconButton(
    icon: widget_icon(icon),
    tooltip: buttonText,
    color: Colors.black,
    onPressed: action
  );
}

Widget widget_main_title(String title, double size_of_text){
    return Text(
      title,
      style: TextStyle(fontSize: size_of_text));
}