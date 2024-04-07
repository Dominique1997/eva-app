import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/eva_translations.dart';

class WidgetActionIconButton extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final Function() action;

  const WidgetActionIconButton({
    super.key,
    required this.icon,
    required this.hintText,
    required this.action,
  });

  @override
  FutureBuilder<String> build(BuildContext context) {
    return FutureBuilder(
      future: EvaTranslations.findTranslation(hintText),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return IconButton(
            onPressed: action,
            tooltip: snapshot.data,
            icon: Icon(icon),
          );
        }
      },
    );
  }
}
