import 'package:flutter/material.dart';

/// Urja Construction brand palette: charcoal primaries and a red accent
/// matching the company logo, with concrete grey neutrals.
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF333333); // logo charcoal
  static const Color primaryDark = Color(0xFF1A1A1A);
  static const Color accent = Color(0xFFE53935); // logo red
  static const Color accentLight = Color(0xFFFF6F60);

  static const Color background = Color(0xFFF5F5F4); // concrete grey
  static const Color surface = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF212529);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color error = Color(0xFFD32F2F);
  static const Color info = Color(0xFF1976D2);

  static const Color border = Color(0xFFDDE1E3);
  static const Color divider = Color(0xFFE9ECEF);

  // Status colors
  static const Color statusActive = Color(0xFF2E7D32);
  static const Color statusCompleted = Color(0xFF1976D2);
  static const Color statusOnHold = Color(0xFFF9A825);

  // Category chart colors
  static const List<Color> categoryColors = [
    Color(0xFFFF6B00), // Material - orange
    Color(0xFF1976D2), // Labour - blue
    Color(0xFF2E7D32), // Transport - green
    Color(0xFF6A1B9A), // Machinery - purple
    Color(0xFFD32F2F), // Diesel - red
    Color(0xFFF9A825), // Electricity - amber
    Color(0xFF00838F), // Food - teal
    Color(0xFF6C757D), // Misc - grey
  ];
}
