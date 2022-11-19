import 'package:flutter/material.dart';
import 'package:reading_timer/pages/counter.dart';
import 'package:reading_timer/pages/selection.dart';

final routes = [
  Selection(),
  Counter(),
];

Route RouteAnimator(int route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        routes.elementAt(route),
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
