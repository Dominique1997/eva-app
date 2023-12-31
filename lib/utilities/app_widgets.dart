import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/translations.dart';

class EvaBaseWidgets {
  late Directory folderContent;
  late List<FileSystemEntity> files;
  late EvaActions _evaAction;
  late List<DropdownMenuItem> languagesMenuItem;

  EvaBaseWidgets() {
    _evaAction = EvaActions();
    folderContent = Directory("translations");
    files = folderContent.listSync();
    languagesMenuItem = <DropdownMenuItem>[];
  }

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  IconButton widgetNavigationIconButton(IconData icon, String hintText, context,
      [navigateToPage]) {
    return IconButton(
        icon: widgetIcon(icon),
        tooltip: hintText,
        onPressed: () => _evaAction.navigateTo(context, navigateToPage));
  }

  IconButton widgetActionIconButton(IconData icon, String hintText, [action]) {
    return IconButton(
        onPressed: action, tooltip: hintText, icon: widgetIcon(icon));
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

  widgetAvailableLanguagesButton() {
    for (final FileSystemEntity file in files) {
      String fileName =
          file.path.replaceAll("translations/", "").replaceAll(".json", "");
      DropdownMenuItem languageItem = DropdownMenuItem(
        child: Text(fileName),
        value: fileName,
      );
      languagesMenuItem.add(languageItem);
    }
    return DropdownButton(
        items: languagesMenuItem, onChanged: (value) => print(value));
  }
}
