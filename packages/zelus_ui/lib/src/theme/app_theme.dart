import 'package:flutter/material.dart';
import 'colors.dart';
import 'typography.dart';

/// Zelus modern app theme
class ZelusTheme {
  /// Get light theme - Modern minimal AI aesthetic
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: ZelusColors.primary,
        secondary: ZelusColors.secondary,
        tertiary: ZelusColors.accent,
        surface: ZelusColors.surface,
        background: ZelusColors.background,
        error: ZelusColors.error,
        onPrimary: ZelusColors.textOnPrimary,
        onSecondary: ZelusColors.textOnPrimary,
        onSurface: ZelusColors.textPrimary,
        onBackground: ZelusColors.textPrimary,
        onError: ZelusColors.textOnPrimary,
      ),
      scaffoldBackgroundColor: ZelusColors.background,
      textTheme: ZelusTypography.getTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: ZelusColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: ZelusTypography.getTextTheme().titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      cardTheme: CardThemeData(
        color: ZelusColors.surface,
        elevation: 0,
        shadowColor: ZelusColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // More rounded
          side: BorderSide(
            color: ZelusColors.border.withOpacity(0.5),
            width: 1,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ZelusColors.primary,
          foregroundColor: ZelusColors.textOnPrimary,
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // More rounded
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ZelusColors.textPrimary,
          side: BorderSide(color: ZelusColors.border, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ZelusColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ZelusColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), // More rounded
          borderSide: BorderSide(color: ZelusColors.border, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: ZelusColors.border, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ZelusColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: ZelusColors.error, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        labelStyle: TextStyle(
          color: ZelusColors.textSecondary,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: ZelusColors.textTertiary,
          fontWeight: FontWeight.w400,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ZelusColors.primary,
        foregroundColor: ZelusColors.textOnPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ZelusColors.surface,
        selectedItemColor: ZelusColors.primary,
        unselectedItemColor: ZelusColors.textTertiary,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: ZelusColors.divider,
        space: 1,
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: ZelusColors.surfaceLight,
        labelStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
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

