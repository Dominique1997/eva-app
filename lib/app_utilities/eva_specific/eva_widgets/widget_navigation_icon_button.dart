import 'package:flutter/material.dart';
import 'package:eva_app/app_utilities/eva_specific/eva_utilities/all_eva_utilities.dart';

class WidgetNavigationIconButton extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final BuildContext materialPageRoute;

  const WidgetNavigationIconButton(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.materialPageRoute});

  @override
  Widget build(BuildContext context) {
    final EvaActions evaAction = EvaActions();
    return FutureBuilder(
      future: EvaTranslations.findTranslation(hintText),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return IconButton(
            icon: Icon(icon),
            tooltip: snapshot.data,
            onPressed: () => evaAction.navigateTo(context, materialPageRoute),
          );
        }
      },
    );
  }
}
