import 'package:flutter/material.dart';

class CustomExpandedScrollView {
  static customScrollView({required Widget child}) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraint.maxHeight,
            ),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
      },
    );
  }
}
