import 'dart:io';
import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_values.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaSettingsPageWidgets extends EvaBaseWidgets {
  late EvaAppValues _evaAppValues;
  late EvaApi _evaApi;
  late bool apiState;
  late State _state;
  String serverURL = "";
  String serverPort = "";
  late Directory folderContent;
  late List<FileSystemEntity> files;

  EvaSettingsPageWidgets(State state) {
    _state = state;
    apiState = false;
    _evaAppValues = EvaAppValues();
    _evaApi = EvaApi();
    folderContent = Directory("translations");
    files = folderContent.listSync();
  }

  Widget widgetPageTitle() {
    return widgetMainTitle("EVA SETTINGS", 50);
  }

  Widget widgetServerURLField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerUrl(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          SizedBox serverURLSizedBox =
              widgetSizedBox(super.widgetTextField("url", true, false, (value) {
            serverURL = value;
          }, TextInputType.number, snapshot.data ?? ""));
          return serverURLSizedBox;
        }
      },
    );
  }

  Widget widgetServerPortField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerPort(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          SizedBox serverPortSizedBox = widgetSizedBox(
              super.widgetTextField("port", true, false, (value) {
            serverPort = value;
          }, TextInputType.number, snapshot.data ?? ""));
          return serverPortSizedBox;
        }
      },
    );
  }

  Widget widgetTestSettingsButton() {
    return widgetActionIconButton(Icons.save_alt, "Test new settings", () {
      _updateApiState(serverURL, serverPort);
    });
  }

  _updateApiState(newServerUrl, newServerPort) async {
    bool updatedApiState = await _evaApi.testApi(newServerUrl, newServerPort);
    _state.setState(() {
      apiState = updatedApiState;
    });
  }

  Widget widgetSaveSettingsButton() {
    return widgetActionIconButton(Icons.save, "Save settings", () {
      _evaAppValues.setServerPort(serverPort);
      _evaAppValues.setServerUrl(serverURL);
      _evaAppValues.setDefaultLanguage(selectedLanguage);
    });
  }

  Widget widgetResetSettingsButton() {
    return widgetActionIconButton(Icons.restore_page, "Reset settings", () {
      _evaAppValues.resetPreferences();
      _state.setState(() {});
    });
  }

  Widget widgetCancelButton(BuildContext context) {
    return widgetNavigationIconButton(Icons.cancel, "Cancel", context);
  }

  Widget widgetApiStateIcon() {
    Icon apiStateIcon = apiState.toString() == "true"
        ? widgetIcon(Icons.radio_button_checked)
        : widgetIcon(Icons.radio_button_unchecked);
    return apiStateIcon;
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
