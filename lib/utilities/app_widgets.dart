import 'dart:io';
import 'package:eva_app/utilities/app_values.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_actions.dart';
import 'package:eva_app/utilities/translations.dart';

class EvaBaseWidgets {
  late Directory folderContent;
  late List<FileSystemEntity> files;
  late EvaAppValues _appValues;
  late EvaActions _evaAction;
  late List<DropdownMenuItem> languagesMenuItem;
  late String selectedLanguage;

  EvaBaseWidgets() {
    _evaAction = EvaActions();
    folderContent = Directory("translations");
    files = folderContent.listSync();
    languagesMenuItem = <DropdownMenuItem>[];
    _appValues = EvaAppValues();
    selectedLanguage = "";
    _appValues.getDefaultLanguage().then((value) => selectedLanguage = value);
  }

  Icon widgetIcon(IconData icon) {
    return Icon(icon);
  }

  Widget widgetNavigationIconButton(IconData icon, String hintText, context,
      [navigateToPage]) {
    return FutureBuilder(
        future: EvaTranslations.findTranslation(hintText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return IconButton(
                icon: widgetIcon(icon),
                tooltip: snapshot.data,
                onPressed: () =>
                    _evaAction.navigateTo(context, navigateToPage));
          }
        });
  }

  Widget widgetActionIconButton(IconData icon, String hintText, [action]) {
    return FutureBuilder(
        future: EvaTranslations.findTranslation(hintText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return IconButton(
                onPressed: action,
                tooltip: snapshot.data,
                icon: widgetIcon(icon));
          }
        });
  }

  SizedBox widgetSizedBox([childElement = Widget]) {
    return SizedBox(
      width: 500,
      child: childElement,
    );
  }

  widgetTextField(String shownHinttext, bool enabled, bool obscureText,
      ValueChanged<String> onChanged, TextInputType typeOfInput,
      [defaultText]) {
    return FutureBuilder(
        future: EvaTranslations.findTranslation(shownHinttext),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return TextField(
              controller: TextEditingController(text: defaultText ?? ""),
              decoration: InputDecoration(
                enabled: enabled,
                border: const OutlineInputBorder(),
                hintText: snapshot.data,
              ),
              onChanged: onChanged,
              obscureText: obscureText,
              keyboardType: typeOfInput,
            );
          }
        });
  }

  Text widgetMainTitle(String mainTitle, double sizeOfText) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }

  Widget widgetTextLable(String text) {
    return FutureBuilder(
        future: EvaTranslations.findTranslation(text),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          return Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 20),
          );
        });
  }

  widgetAvailableLanguagesDropDown() {
    for (final FileSystemEntity file in files) {
      String fileName =
          file.path.replaceAll("translations/", "").replaceAll(".json", "");
      DropdownMenuItem languageItem = DropdownMenuItem(
        value: fileName,
        child: Text(fileName),
      );
      languagesMenuItem.add(languageItem);
    }
    return DropdownButton(
      items: languagesMenuItem,
      onChanged: (value) => selectedLanguage = value,
    );
  }
}
