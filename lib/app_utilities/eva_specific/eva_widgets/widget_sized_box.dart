import 'package:flutter/material.dart';

class WidgetSizedBox extends StatelessWidget {
  final Widget childElement;
  const WidgetSizedBox({super.key, required this.childElement});

  @override
  SizedBox build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: childElement,
    );
  }
}
