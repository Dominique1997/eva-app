import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_values.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaSettingsPageWidgets extends EvaBaseWidgets {
  late EvaAppValues _evaAppValues;
  late String serverURL;
  late String serverPort;

  EvaSettingsPageWidgets() {
    _evaAppValues = EvaAppValues();
    serverURL = "";
    serverPort = "";
  }

  Widget pageTitle() {
    return super.widgetMainTitle("EVA SETTINGS", 50);
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
          SizedBox serverURLSizedBox = super.widgetSizedBox(super
              .widgetTextField("url", true, false, (value) => serverURL = value,
                  TextInputType.number, snapshot.data ?? ""));
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
          SizedBox serverPortSizedBox = super.widgetSizedBox(super
              .widgetTextField(
                  "port",
                  true,
                  false,
                  (value) => serverPort = value,
                  TextInputType.number,
                  snapshot.data ?? ""));
          return serverPortSizedBox;
        }
      },
    );
  }

  Widget widgetSaveSettingsButton() {
    return super.widgetActionIconButton(Icons.save, "Save settings", () {
      _evaAppValues.setServerPort(serverPort);
      _evaAppValues.setServerUrl(serverURL);
      _evaAppValues.setDefaultLanguage(selectedLanguage);
    });
  }

  Widget widgetResetSettingsButton() {
    return super.widgetActionIconButton(Icons.restore_page, "Reset settings",
        () {
      _evaAppValues.resetPreferences();
    });
  }

  Widget widgetCancelButton(BuildContext context) {
    return super.widgetNavigationIconButton(Icons.cancel, "Cancel", context);
  }
}
