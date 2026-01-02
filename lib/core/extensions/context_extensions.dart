import 'package:flutter/material.dart';

extension ContextValues on BuildContext {
  // Sizing
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  bool get isTablet => width > 600;

  // Theme
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  // Colors (Shortcuts)
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
}
