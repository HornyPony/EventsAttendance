import 'package:flutter/cupertino.dart';

class CustomNavigationTransistor {
  static Widget fade(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: const Interval(
          0,
          1,
          curve: Curves.linear,
        ),
      ),
      child: child,
    );
  }

  static const int durationInMilliseconds = 200;
}
