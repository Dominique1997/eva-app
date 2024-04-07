import 'dart:convert';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_values.dart';
import 'package:flutter/services.dart' show rootBundle;

class EvaTranslations {
  static Future<String> findTranslation(text) async {
    EvaAppValues appvalue = EvaAppValues();
    String language = await appvalue.getDefaultLanguage();
    if (language == "English") {
      return text;
    }

    String translationsContent =
        await rootBundle.loadString("translations/$language.json");
    var jsonData = json.decode(translationsContent);
    if (jsonData[text] != null) {
      return jsonData[text];
    }
    return Future(() => "$text-not-translated");
  }
}
