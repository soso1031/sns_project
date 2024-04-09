import 'package:flutter/material.dart';

extension ContextEx on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get safeAreaBottomHeight => MediaQuery.paddingOf(this).bottom;

  double get safeAreaTopHeight => MediaQuery.paddingOf(this).top;
}
