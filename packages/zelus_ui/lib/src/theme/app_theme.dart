import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

/// Zelus app theme
class ZelusTheme {
  /// Get light theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: ZelusColors.charcoal,
        secondary: ZelusColors.gold,
        surface: ZelusColors.surface,
        background: ZelusColors.white,
        error: ZelusColors.error,
        onPrimary: ZelusColors.white,
        onSecondary: ZelusColors.charcoal,
        onSurface: ZelusColors.textPrimary,
        onBackground: ZelusColors.textPrimary,
        onError: ZelusColors.white,
      ),
      scaffoldBackgroundColor: ZelusColors.white,
      textTheme: ZelusTypography.getTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: ZelusColors.white,
        foregroundColor: ZelusColors.charcoal,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: ZelusTypography.getTextTheme().headlineMedium,
      ),
      cardTheme: CardTheme(
        color: ZelusColors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ZelusColors.charcoal,
          foregroundColor: ZelusColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ZelusColors.charcoal,
          side: const BorderSide(color: ZelusColors.divider),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ZelusColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ZelusColors.gold, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: ZelusColors.error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      dividerTheme: const DividerThemeData(
        color: ZelusColors.divider,
        space: 1,
        thickness: 1,
      ),
    );
  }

  /// Get dark theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: ZelusColors.gold,
        secondary: ZelusColors.charcoal,
        surface: const Color(0xFF1F2937),
        background: const Color(0xFF111827),
        error: ZelusColors.error,
        onPrimary: ZelusColors.charcoal,
        onSecondary: ZelusColors.white,
        onSurface: ZelusColors.white,
        onBackground: ZelusColors.white,
        onError: ZelusColors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF111827),
      textTheme: ZelusTypography.getTextTheme().apply(
        bodyColor: ZelusColors.white,
        displayColor: ZelusColors.white,
      ),
      // Add more dark theme configurations as needed
    );
  }
}

