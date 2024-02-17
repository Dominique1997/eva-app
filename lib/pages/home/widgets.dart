import 'package:flutter/material.dart';
import 'package:eva_app/utilities/app_api.dart';
import 'package:eva_app/utilities/app_widgets.dart';

class EvaHomePageWidgets extends EvaBaseWidgets {
  String question = "";
  String response = "";
  late EvaApi _evaApi;
  late State _state;
  late List _chatHistory;

  EvaHomePageWidgets(State state) {
    _state = state;
    _evaApi = EvaApi();
    _chatHistory = [];
  }

  Widget widgetPageTitle() {
    return widgetMainTitle("EVA HOME PAGE", 50);
  }

  Widget widgetLogoutButton(BuildContext context) {
    return widgetNavigationIconButton(Icons.logout, "Logout", context);
  }

  Widget widgetCommandInputField() {
    SizedBox inputSizedBox = widgetSizedBox(widgetTextField("Question", true,
        false, ((value) => question = value), TextInputType.text));
    return inputSizedBox;
  }

  Widget widgetSendCommandButton() {
    return widgetActionIconButton(
        Icons.send,
        "Send question",
        () => {
              _evaApi.checkCommand(question).then((value) => {
                    response = value,
                    _chatHistory.add([question, value]),
                    _state.setState(() {})
                  }),
            });
  }

  Widget widgetTestButton() {
    return widgetActionIconButton(Icons.question_mark, "Test button",
        () => debugPrint("Hi i am a test button"));
  }

  Widget widgetChatHistory() {
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
          child: Text("AI: $response", style: const TextStyle(fontSize: 20)),
        ),
      ],
    );
  }

  Widget widgetChatHistoryListView() {
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
