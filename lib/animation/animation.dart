import 'package:flutter/material.dart';

/// Creates a [PageRouteBuilder] with a slide-in transition from the right.
///
/// [page] is the widget for the new route.
///
/// Example usage:
/// ```dart
/// Navigator.of(context).push(createPageRoute(const SomePage()));
/// ```
PageRouteBuilder<T> createPageRoute<T>(Widget page) {
  return PageRouteBuilder<T>(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end);
      var offsetAnimation =
          animation.drive(tween.chain(CurveTween(curve: curve)));

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
