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
    //_evaAppValues.getServerUrl().then((value) => serverURL = value);
    //_evaAppValues.getServerPort().then((value) => serverPort = value);
  }

  Text pageTitleText() {
    return super.widgetMainTitle("EVA SETTINGS", 50);
  }

  Widget widgetServerURLTextField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerUrl(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle error scenario
          return Text('Error: ${snapshot.error}');
        } else {
          TextField serverURLTextField = super.widgetTextField(
              "url",
              true,
              false,
              (value) => serverURL = value,
              TextInputType.number,
              snapshot.data ?? "");
          SizedBox serverURLSizedBox = super.widgetSizedBox(serverURLTextField);
          return serverURLSizedBox;
        }
      },
    );
  }

  Widget widgetServerPortTextField() {
    return FutureBuilder<String?>(
      future: _evaAppValues.getServerPort(),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          TextField serverPortTextField = super.widgetTextField(
              "port",
              true,
              false,
              (value) => serverPort = value,
              TextInputType.number,
              snapshot.data ?? "");
          SizedBox serverPortSizedBox =
              super.widgetSizedBox(serverPortTextField);
          return serverPortSizedBox;
        }
      },
    );
  }

  TextButton widgetSaveSettingsTextButton() {
    return super.widgetActionTextButton("Save settings", () {
      _evaAppValues.setServerPort(serverPort);
      _evaAppValues.setServerUrl(serverURL);
    });
  }

  TextButton widgetResetSettingsTextButton() {
    return super.widgetActionTextButton("Reset settings", () {
      _evaAppValues.resetPreferences();
    });
  }

  TextButton widgetCancelTextButton(BuildContext context) {
    return super.widgetNavigationTextButton("Cancel", context);
  }
}
