import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_actions.dart';
import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_widgets/all_eva_widgets.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_api.dart';

class EvaHomePageWidgets {
  String question = "";
  String response = "";
  final EvaActions evaActions = EvaActions();
  late EvaApi _evaApi;
  late List _chatHistory;

  EvaHomePageWidgets() {
    _evaApi = EvaApi();
    _chatHistory = [];
  }

  WidgetMainTitle widgetPageTitle() {
    return const WidgetMainTitle(
      mainTitle: "EVA HOME PAGE",
      sizeOfText: 50,
    );
  }

  WidgetActionIconButton widgetLogoutButton(BuildContext context) {
    return WidgetActionIconButton(
      icon: Icons.logout,
      hintText: "Logout",
      action: () => evaActions.navigateTo(context),
    );
  }

  WidgetSizedBox widgetCommandInputField() {
    Function(String) inputChanged = ((value) => question = value);
    WidgetSizedBox inputSizedBox = WidgetSizedBox(
      childElement: WidgetTextField(
        defaultText: "",
        shownHinttext: "Question",
        enabled: true,
        obscureText: false,
        onChanged: inputChanged,
        typeOfInput: TextInputType.text,
      ),
    );
    return inputSizedBox;
  }

  WidgetActionIconButton widgetSendCommandButton() {
    return WidgetActionIconButton(
      icon: Icons.send,
      hintText: "Send question",
      action: () => {
        _evaApi.checkCommand(question).then((value) => {
              response = value,
              _chatHistory.add([question, value]),
            })
      },
    );
  }

  WidgetActionIconButton widgetTestButton() {
    return WidgetActionIconButton(
      icon: Icons.question_mark,
      hintText: "Test button",
      action: () => debugPrint("Hi i am a test button"),
    );
  }

  Column widgetChatHistory() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "You: $question",
            style: const TextStyle(fontSize: 20),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            "AI: $response",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  ListView widgetChatHistoryListView() {
    return ListView.builder(
      itemCount: _chatHistory.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            _chatHistory[index][0],
          ),
          subtitle: Text(
            _chatHistory[index][1],
          ),
        );
      },
    );
  }
}
