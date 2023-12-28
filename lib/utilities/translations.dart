import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  static Future findTranslation(text, language) async {
    if (language == "English") {
      return text;
    }

    String translationsContent =
        await rootBundle.loadString("translations/$language.json");
    var jsonData = json.decode(translationsContent);
    if (jsonData[text] != null) {
      var data = jsonData[text];
      return Future(() => data);
    }
    return Future(() => "$text-not-translated");
  }
}
