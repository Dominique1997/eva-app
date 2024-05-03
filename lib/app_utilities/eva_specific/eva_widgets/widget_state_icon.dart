import 'package:flutter/material.dart';

class WidgetStateIcon extends StatefulWidget {
  final IconData iconData;
  Color iconColor;
  WidgetStateIcon({super.key, required this.iconData, required this.iconColor});

  @override
  State<WidgetStateIcon> createState() => _WidgetStateIconState();
}

class _WidgetStateIconState extends State<WidgetStateIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.iconData,
      color: widget.iconColor,
    );
  }
}
