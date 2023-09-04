import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double getdynamicHeight(double height) {
    return (MediaQuery.of(this).size.height) * height;
  }

  double getdynamicWidth(double width) {
    return (MediaQuery.of(this).size.width) * width;
  }
}
