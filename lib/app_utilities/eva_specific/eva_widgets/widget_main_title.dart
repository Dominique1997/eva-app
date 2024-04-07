import 'package:flutter/material.dart';

class WidgetMainTitle extends StatelessWidget {
  final String mainTitle;
  final double sizeOfText;
  const WidgetMainTitle({
    super.key,
    required this.mainTitle,
    required this.sizeOfText,
  });

  @override
  Text build(BuildContext context) {
    return Text(mainTitle, style: TextStyle(fontSize: sizeOfText));
  }
}
