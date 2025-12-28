import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors pulled from the dark "OpsPilot" UI screenshots
  static const Color background = Color(0xFF0F172A); // Slate 900
  static const Color surface = Color(0xFF1E293B); // Slate 800
  static const Color surfaceHighlight = Color(
    0xFF334155,
  ); // Slate 700 (borders/hover)

  static const Color primary = Color(0xFF2563EB); // Blue 600
  static const Color primaryDark = Color(0xFF1D4ED8); // Blue 700

  static const Color text = Color(0xFFF8FAFC); // Slate 50
  static const Color textMuted = Color(0xFF94A3B8); // Slate 400
  static const Color textDim = Color(0xFF64748B); // Slate 500

  // Semantic
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color error = Color(0xFFEF4444); // Red 500

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        background: background,
        surface: surface,
        primary: primary,
        secondary: primary, // fallback
        onBackground: text,
        onSurface: text,
        error: error,
      ),

      // Typography
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: TextStyle(color: text, fontWeight: FontWeight.bold),
            displayMedium: TextStyle(color: text, fontWeight: FontWeight.bold),
            displaySmall: TextStyle(color: text, fontWeight: FontWeight.bold),
            headlineLarge: TextStyle(color: text, fontWeight: FontWeight.w600),
            headlineMedium: TextStyle(color: text, fontWeight: FontWeight.w600),
            bodyLarge: TextStyle(color: text),
            bodyMedium: TextStyle(color: textMuted),
            titleMedium: TextStyle(color: text, fontWeight: FontWeight.w500),
          ),

      // Input Decoration (Text Fields)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: TextStyle(color: textDim),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: surfaceHighlight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: surfaceHighlight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primary),
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 0,
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
      ),

      // Icon Theme
      iconTheme: const IconThemeData(color: textMuted),
    );
  }
}
