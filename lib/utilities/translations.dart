import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations{

  static Future findTranslation(text, language) async {
    if(language == "English"){
      return text;
    }
    
    String translations_content = await rootBundle.loadString("translations/$language.json");
    var json_data = json.decode(await translations_content);
    if(json_data[text] != null){
      var data = json_data[text];
      return Future(() => data);
    }
    return Future(() => "$text-not-translated");
  }
}