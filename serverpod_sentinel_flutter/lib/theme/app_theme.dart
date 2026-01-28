import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens and themes for Serverpod Sentinel.
/// Modernized for Enterprise Grade "Fluid-Utility" aesthetic.
class AppTheme {
  static const double mobileBreakpoint = 400;
  static const double tabletBreakpoint = 1024;

  static const Color primary = Color(0xFF135BEC);
  static const Color primaryLight = Color(0xFF60A5FA);
  
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  static const Color darkBackground = Color(0xFF060910);
  static const Color darkSurface = Color(0xFF0F172A);
  static const Color darkSurfaceVariant = Color(0xFF1E293B);
  static const Color darkSurfaceHighlight = Color(0xFF334155);
  static const Color darkBorder = Color(0xFF1E293B);
  static const Color darkBorderHighlight = Color(0xFF334155);
  
  static const Color darkText = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFFCBD5E1);
  static const Color darkTextMuted = Color(0xFF94A3B8);
  static const Color darkTextDim = Color(0xFF64748B);

  // Shadows
  static List<BoxShadow> get shadowLow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowHigh => [
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      blurRadius: 32,
      offset: const Offset(0, 8),
    ),
  ];

  // LEGACY ALIASES
  static const Color background = darkBackground;
  static const Color surface = darkSurface;
  static const Color surfaceHighlight = darkSurfaceHighlight;
  static const Color text = darkText;
  static const Color textMuted = darkTextMuted;
  static const Color textDim = darkTextDim;
  
  // Static Getters for Compatibility
  static Color get lightBackground => darkBackground;
  static Color get lightSurfaceHighlight => darkSurfaceHighlight;
  static Color get lightSurfaceVariant => darkSurfaceVariant;
  static Color get lightBorder => darkBorder;
  static Color get lightTextMuted => darkTextMuted;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: primaryLight,
        surface: darkSurface,
        onSurface: darkText,
        error: error,
        outline: darkBorder,
      ),
      textTheme: _buildTextTheme(),
      inputDecorationTheme: _buildInputDecoration(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: darkBorder),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: darkText,
        elevation: 0,
      ),
    );
  }

  static ThemeData get lightTheme => darkTheme;

  static TextTheme _buildTextTheme() {
    return GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
      displayLarge: GoogleFonts.manrope(color: darkText, fontWeight: FontWeight.w800),
      headlineLarge: GoogleFonts.manrope(color: darkText, fontWeight: FontWeight.w700),
      titleLarge: GoogleFonts.manrope(color: darkText, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.inter(color: darkText, fontSize: 16),
      bodyMedium: GoogleFonts.inter(color: darkTextSecondary, fontSize: 14),
      bodySmall: GoogleFonts.inter(color: darkTextMuted, fontSize: 12),
    );
  }

  static InputDecorationTheme _buildInputDecoration() {
    return InputDecorationTheme(
      filled: true,
      fillColor: darkSurfaceVariant.withOpacity(0.5),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: darkBorder),
      ),
    );
  }

  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

extension AppThemeExtension on BuildContext {
  bool get isDark => true;
  Color get textSecondary => AppTheme.darkTextSecondary;
  Color get textMuted => AppTheme.darkTextMuted;
  Color get border => AppTheme.darkBorder;
  Color get borderHighlight => AppTheme.darkBorderHighlight;
  Color get surfaceVariant => AppTheme.darkSurfaceVariant;
  Color get surfaceHighlight => AppTheme.darkSurfaceHighlight;
}
