import 'package:flutter/material.dart';

class EvaActions{
  navigateTo(context, [routingPage]){
    {
      if(routingPage != null)
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routingPage)
        );
    }
      else
      {
        Navigator.pop(context);
      }
    }
  }
}
