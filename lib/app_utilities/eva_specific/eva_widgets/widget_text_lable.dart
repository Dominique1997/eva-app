import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_translations.dart';

class WidgetTextLable extends StatelessWidget {
  final String text;
  const WidgetTextLable({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: EvaTranslations.findTranslation(text),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          return Text(
            snapshot.data.toString(),
            style: const TextStyle(fontSize: 20),
          );
        });
  }
}
