import "package:flutter/material.dart";

class EvaAnimations {
  AnimatedContainer circle() {
    return AnimatedContainer(
        duration: const Duration(seconds: 10),
        child: Hero(
          child: Text("CIRCLE"),
          tag: "CIRCLE",
        ));
  }
}
