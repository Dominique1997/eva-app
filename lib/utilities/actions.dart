import 'package:flutter/material.dart';

navigate_to(context, routingPage){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => routingPage),
    );
}

navigate_back(context){
  Navigator.pop(context);
}