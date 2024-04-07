import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/base/base_utilities/base_translations.dart';

class BaseWidgetTextLable extends StatelessWidget {
  final String notTranslatedText;
  final double fontSize;
  const BaseWidgetTextLable(
      {super.key, required this.notTranslatedText, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: BaseTranslations.findTranslation(notTranslatedText),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          return Text(
            snapshot.data.toString(),
          );
        });
  }
}
