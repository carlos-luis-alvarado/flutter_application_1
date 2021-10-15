import 'package:flutter/material.dart';

class Fade_Transition extends PageRouteBuilder {
  final Widget child;

  Fade_Transition(this.child)
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return child;
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new FadeTransition(
            opacity: animation,
            child: child,
          );
        });
}
