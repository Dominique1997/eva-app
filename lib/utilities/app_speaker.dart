import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class EvaSpeaker {
  late FlutterTts _flutterTts;
  EvaSpeaker() {
    _flutterTts = FlutterTts();
    _getDefaultEngine();
  }

  Future _getDefaultEngine() async {
    var engine = await _flutterTts.getDefaultEngine;
    if (engine != null) {
      debugPrint(engine);
    }
  }

  speak(String text) {
    _flutterTts.speak(text);
  }
}
