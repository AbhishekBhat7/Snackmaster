import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8B2500);
  static const Color primaryLight = Color(0xFFB23A00);
  static const Color background = Color(0xFFFAF6F1);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFF8F2);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textMuted = Color(0xFF999999);
  static const Color greenDark = Color(0xFF2E7D32);
  static const Color greenLight = Color(0xFFE8F5E9);
  static const Color orangeLight = Color(0xFFFFF3E0);
  static const Color orangeText = Color(0xFFE65100);
  static const Color redLight = Color(0xFFFFEBEE);
  static const Color redText = Color(0xFFC62828);
  static const Color chipBorder = Color(0xFFE0E0E0);
  static const Color chipSelected = Color(0xFFFFEBEE);
  static const Color chipSelectedBorder = Color(0xFFB23A00);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color quantityBg = Color(0xFFF5F5F5);
  static const Color infoBannerBg = Color(0xFFFFF8E1);
  static const Color infoBannerText = Color(0xFFE65100);
  static const Color stockGreen = Color(0xFFE8F5E9);
  static const Color stockGreenText = Color(0xFF2E7D32);
  static const Color stockOrange = Color(0xFFFFF3E0);
  static const Color stockOrangeText = Color(0xFFE65100);
  static const Color outOfStock = Color(0xFFEEEEEE);
  static const Color outOfStockText = Color(0xFF757575);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        background: AppColors.background,
        surface: AppColors.surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}