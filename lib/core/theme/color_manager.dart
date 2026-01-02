import 'package:flutter/material.dart';

class ColorManager {
  static const Color primary = Color(0xFF1ABC9C);
  static const Color primaryDark = Color(0xFF16A085);
  static const Color background = Color(0xFFF8F9FD);
  static const Color text = Colors.black87;
  static const Color textLight = Colors.black54;
  static const Color white = Colors.white;
  static const Color error = Colors.redAccent;

  // Specific UI Colors
  static const Color navActive = Color(0xFF305189); // Navy Blue from feedback
  static const Color textMain = Color(0xFF121212); // Primary Black text

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF11CC9A), Color(0xFF305189)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient darkOverlayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.black54, Colors.transparent],
  );
}
