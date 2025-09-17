import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Blue color palette
  static const Color primaryCyan = Color(0xFF1976D2); // Primary Blue
  static const Color secondaryCyan = Color(0xFF42A5F5); // Light Blue
  static const Color accentCyan = Color(0xFF90CAF9); // Lighter Blue
  static const Color lightCyan = Color(0xFFBBDEFB); // Very Light Blue
  static const Color darkCyan = Color(0xFF1565C0); // Dark Blue
  static const Color cyanBackground = Color(0xFFF5F8FF);
  
  // Neutral colors
  static const Color darkText = Color(0xFF212121);
  static const Color mediumText = Color(0xFF757575);
  static const Color lightText = Color(0xFFBDBDBD);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);
  static const Color divider = Color(0xFFE0E0E0);
  
  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  
  // Typography
  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: mediumText,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: mediumText,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: darkText,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: mediumText,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: lightText,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: darkText,
    ),
  );
  
  // Updated theme data with blue color scheme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryCyan).copyWith(
      secondary: secondaryCyan,
      tertiary: accentCyan,
      surface: surface,
    ),
    textTheme: GoogleFonts.openSansTextTheme(textTheme),
    scaffoldBackgroundColor: background,
    appBarTheme: AppBarTheme(
      backgroundColor: background,
      foregroundColor: darkText,
      elevation: 0,
      titleTextStyle: GoogleFonts.openSans(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: darkText,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: background,
      selectedItemColor: primaryCyan,
      unselectedItemColor: lightText,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryCyan,
        foregroundColor: background,
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        elevation: 2,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryCyan,
        side: BorderSide(color: primaryCyan),
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: primaryCyan, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: divider),
      ),
      labelStyle: GoogleFonts.openSans(color: mediumText),
      hintStyle: GoogleFonts.openSans(color: lightText),
    ),
    cardTheme: CardThemeData(
      color: background,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}
