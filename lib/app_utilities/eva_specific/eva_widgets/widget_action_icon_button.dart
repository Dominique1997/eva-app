import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/all_eva_utilities.dart';

class WidgetActionIconButton extends StatefulWidget {
  final String hintText;
  final Function() action;
  final IconData icon;

  const WidgetActionIconButton(
      {super.key,
      required this.hintText,
      required this.action,
      required this.icon});

  @override
  State<WidgetActionIconButton> createState() => _WidgetActionIconButtonState();
}

class _WidgetActionIconButtonState extends State<WidgetActionIconButton> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EvaTranslations.findTranslation(widget.hintText),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return IconButton(
            onPressed: widget.action,
            tooltip: snapshot.data,
            icon: Icon(widget.icon),
          );
        }
      },
    );
  }

  void updateState() {
    setState(() {});
  }
}
