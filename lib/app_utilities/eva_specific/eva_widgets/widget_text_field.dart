import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/all_eva_utilities.dart';

class WidgetTextField extends StatefulWidget {
  final String shownHinttext;
  final bool enabled;
  final bool obscureText;
  final Function(String) onChanged;
  final TextInputType typeOfInput;
  final String defaultText;

  WidgetTextField(
      {super.key,
      required this.shownHinttext,
      required this.enabled,
      required this.obscureText,
      required this.onChanged,
      required this.typeOfInput,
      required this.defaultText});

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EvaTranslations.findTranslation(widget.shownHinttext),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return TextField(
            controller: TextEditingController(text: widget.defaultText),
            decoration: InputDecoration(
              enabled: widget.enabled,
              border: const OutlineInputBorder(),
              hintText: snapshot.data,
            ),
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            keyboardType: widget.typeOfInput,
          );
        }
      },
    );
  }
}
