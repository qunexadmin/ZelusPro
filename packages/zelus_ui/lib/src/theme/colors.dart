import 'package:flutter/material.dart';

/// Zelus modern color palette - AI-inspired minimal design
class ZelusColors {
  // Primary Colors - Modern Purple/Blue gradient palette
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryDark = Color(0xFF4F46E5);
  
  static const Color secondary = Color(0xFF8B5CF6); // Purple
  static const Color secondaryLight = Color(0xFFA78BFA);
  static const Color secondaryDark = Color(0xFF7C3AED);
  
  static const Color accent = Color(0xFF06B6D4); // Cyan
  static const Color accentLight = Color(0xFF22D3EE);
  static const Color accentDark = Color(0xFF0891B2);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF06B6D4), Color(0xFF3B82F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Background Colors - Soft and airy
  static const Color background = Color(0xFFFAFAFC); // Very light purple tint
  static const Color backgroundAlt = Color(0xFFF5F5F9);
  
  // Surface Colors - Modern glassmorphism
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFFAFAFC);
  static const Color surfaceDark = Color(0xFFF1F5F9);
  static const Color surfaceGlass = Color(0xF2FFFFFF); // 95% opacity for glass effect
  
  // Text Colors - Better hierarchy
  static const Color textPrimary = Color(0xFF0F172A); // Darker for better contrast
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  
  // Status Colors - Modern, softer tones
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);
  
  // Divider & Borders
  static const Color divider = Color(0xFFE2E8F0);
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderLight = Color(0xFFF1F5F9);
  
  // Shadows & Effects
  static const Color shadow = Color(0x08000000);
  static const Color shadowMedium = Color(0x10000000);
  static const Color shadowHeavy = Color(0x18000000);
  
  // Legacy colors for backward compatibility
  static const Color charcoal = textPrimary;
  static const Color gold = Color(0xFFB8956A);
  static const Color white = Color(0xFFFFFFFF);
}

