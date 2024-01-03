import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class EvaTranslations {
  static Future<String> findTranslation(text, language) async {
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
