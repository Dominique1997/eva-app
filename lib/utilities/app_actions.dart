import 'package:flutter/material.dart';

class EvaActions{
  navigateTo(context, routingPage){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => routingPage),
    );
  }

  navigateBack(context){
    Navigator.pop(context);
  }
}
