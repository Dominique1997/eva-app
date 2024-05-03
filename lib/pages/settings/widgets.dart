import 'dart:io';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_api.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_values.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_widgets/all_eva_widgets.dart';

class EvaSettingsPageWidgets {
  final EvaActions evaActions = EvaActions();
  final EvaAppValues _evaAppValues = EvaAppValues();
  final EvaApi _evaApi = EvaApi();
  bool apiState = false;
  String serverURL = "";
  String serverPort = "";
  late Directory folderContent;
  late List<FileSystemEntity> files;
  List<DropdownMenuItem<dynamic>> languagesMenuItems = [];
  late String selectedLanguage;

  EvaSettingsPageWidgets() {
    folderContent = Directory("translations");
    files = folderContent.listSync();
  }

  WidgetMainTitle widgetPageTitle() {
    return const WidgetMainTitle(
      mainTitle: "EVA SETTINGS",
      sizeOfText: 50,
    );
  }

  FutureBuilder<String?> widgetServerURLField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerUrl(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          WidgetSizedBox serverURLSizedBox = WidgetSizedBox(
            childElement: WidgetTextField(
              defaultText: "",
              enabled: true,
              obscureText: false,
              onChanged: (value) {
                serverURL = value;
              },
              typeOfInput: TextInputType.number,
              shownHinttext: "url",
            ),
          );
          return serverURLSizedBox;
        }
      },
    );
  }

  FutureBuilder<String?> widgetServerPortField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerPort(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          WidgetSizedBox serverPortSizedBox = WidgetSizedBox(
            childElement: WidgetTextField(
              shownHinttext: "port",
              enabled: true,
              obscureText: false,
              onChanged: (value) {
                serverPort = value;
              },
              typeOfInput: TextInputType.number,
              defaultText: serverPort,
            ),
          );
          return serverPortSizedBox;
        }
      },
    );
  }

  WidgetActionIconButton widgetTestSettingsButton() {
    return WidgetActionIconButton(
        icon: Icons.save_alt,
        hintText: "Test new settings",
        action: () {
          _updateApiState(
            serverURL,
            serverPort,
          );
        });
  }

  _updateApiState(newServerUrl, newServerPort) async {
    debugPrint("$newServerPort $newServerUrl");
    bool test_state = await _evaApi.testApi(
      newServerUrl,
      newServerPort,
    );
    apiState = test_state;
  }

  WidgetActionIconButton widgetSaveSettingsButton() {
    return WidgetActionIconButton(
      icon: Icons.save,
      hintText: "Save settings",
      action: () {
        _evaAppValues.setServerPort(serverPort);
        _evaAppValues.setServerUrl(serverURL);
        _evaAppValues.setDefaultLanguage(selectedLanguage);
      },
    );
  }

  WidgetActionIconButton widgetResetSettingsButton() {
    return WidgetActionIconButton(
      icon: Icons.restore_page,
      hintText: "Reset settings",
      action: () {
        _evaAppValues.resetPreferences();
      },
    );
  }

  WidgetActionIconButton widgetCancelButton(BuildContext context) {
    return WidgetActionIconButton(
      icon: Icons.cancel,
      hintText: "Cancel",
      action: () => evaActions.navigateTo(context),
    );
  }

  WidgetStateIcon widgetApiStateIcon() {
    return apiState.toString() == "true"
        ? WidgetStateIcon(
            iconData: Icons.circle,
            iconColor: Colors.green,
          )
        : WidgetStateIcon(
            iconData: Icons.circle,
            iconColor: Colors.red,
          );
  }

  DropdownButton widgetAvailableLanguagesDropDown() {
    for (final FileSystemEntity file in files) {
      String fileName =
          file.path.replaceAll("translations/", "").replaceAll(".json", "");
      DropdownMenuItem<String> languageItem = DropdownMenuItem(
        value: fileName,
        child: Text(fileName),
      );
      languagesMenuItems.add(languageItem);
    }
    return DropdownButton(
      items: languagesMenuItems,
      onChanged: (value) => selectedLanguage = value,
    );
  }

  WidgetTextLable widgetServerUrlLable() {
    return const WidgetTextLable(text: "Server IP/URL");
  }

  WidgetTextLable widgetServerPortLable() {
    return const WidgetTextLable(text: "Server Port");
  }

  WidgetTextLable widgetLanguageLable() {
    return const WidgetTextLable(text: "Language");
  }
}
