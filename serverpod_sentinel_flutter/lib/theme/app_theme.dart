import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // New Colors from HTML
  static const Color background = Color(0xFF101622); // background-dark
  static const Color surface = Color(0xFF192233); // dark form background
  static const Color surfaceHighlight = Color(0xFF324467); // borders

  // Breakpoints
  static const double mobileBreakpoint = 400;
  static const double tabletBreakpoint =
      1024; // Updated to match tailwind lg (1024px)

  static const Color primary = Color(0xFF135BEC); // #135bec

  static const Color text = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF92A4C9);
  static const Color textDim = Color(0xFF64748B);

  // Semantic
  static const Color success = Color(0xFF34D399); // emerald-400
  static const Color error = Color(0xFFEF4444);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,

      // Color Scheme
      colorScheme: const ColorScheme.dark(
        surface: surface,
        primary: primary,
        secondary: primary,
        error: error,
      ),

      // Typography
      textTheme: GoogleFonts.notoSansTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w800,
            ),
            displayMedium: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w800,
            ),
            displaySmall: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w700,
            ),
            headlineLarge: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w700,
            ),
            headlineMedium: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w700,
            ),
            titleLarge: GoogleFonts.manrope(
              color: text,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: GoogleFonts.notoSans(color: text),
            bodyMedium: GoogleFonts.notoSans(color: textMuted),
            bodySmall: GoogleFonts.notoSans(color: textDim),
          ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: textDim),
        prefixIconColor: textDim,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: surfaceHighlight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: surfaceHighlight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primary, width: 2),
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: primary.withOpacity(0.3),
          textStyle: GoogleFonts.manrope(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        ),
      ),
    );
  }
}
