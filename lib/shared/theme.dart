import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary Colors
Color whiteColor = const Color(0xFFFFFFFF);
Color greenColor = const Color(0xFF3EB489);

// Extended Color Palette for POS System
Color blackColor = const Color(0xFF1A1A1A);
Color greyColor = const Color(0xFF6B7280);
Color lightGreyColor = const Color(0xFFF3F4F6);
Color darkGreyColor = const Color(0xFF374151);
Color borderColor = const Color(0xFFE5E7EB);

// Status Colors
Color successColor = const Color(0xFF10B981);
Color errorColor = const Color(0xFFEF4444);
Color warningColor = const Color(0xFFF59E0B);
Color infoColor = const Color(0xFF3B82F6);

// Background Colors
Color backgroundColor = const Color(0xFFFAFAFA);
Color cardColor = const Color(0xFFFFFFFF);
Color surfaceColor = const Color(0xFFF9FAFB);

// Green Variations
Color lightGreenColor = const Color(0xFFECFDF5);
Color darkGreenColor = const Color(0xFF047857);

// Font Weights
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

// Text Styles
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);

// Heading Text Styles
TextStyle h1TextStyle = GoogleFonts.poppins(
  fontSize: 32,
  fontWeight: bold,
  color: blackColor,
);

TextStyle h2TextStyle = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: semiBold,
  color: blackColor,
);

TextStyle h3TextStyle = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: semiBold,
  color: blackColor,
);

TextStyle h4TextStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: medium,
  color: blackColor,
);

// Body Text Styles
TextStyle bodyLargeTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: regular,
  color: blackColor,
);

TextStyle bodyMediumTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: regular,
  color: blackColor,
);

TextStyle bodySmallTextStyle = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: regular,
  color: greyColor,
);

// Button Text Styles
TextStyle buttonTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: semiBold,
  color: whiteColor,
);

TextStyle buttonSecondaryTextStyle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: semiBold,
  color: greenColor,
);

// Price Text Styles (Important for POS)
TextStyle priceTextStyle = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: bold,
  color: greenColor,
);

TextStyle largePriceTextStyle = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: bold,
  color: greenColor,
);

TextStyle smallPriceTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: semiBold,
  color: greenColor,
);

// Caption and Label Styles
TextStyle captionTextStyle = GoogleFonts.poppins(
  fontSize: 12,
  fontWeight: regular,
  color: greyColor,
);

TextStyle labelTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: medium,
  color: blackColor,
);

// Error and Success Text Styles
TextStyle errorTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: medium,
  color: errorColor,
);

TextStyle successTextStyle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: medium,
  color: successColor,
);

// Complete Theme Data
ThemeData appTheme = ThemeData(
  primarySwatch: MaterialColor(0xFF3EB489, {
    50: const Color(0xFFECFDF5),
    100: const Color(0xFFD1FAE5),
    200: const Color(0xFFA7F3D0),
    300: const Color(0xFF6EE7B7),
    400: const Color(0xFF34D399),
    500: const Color(0xFF3EB489),
    600: const Color(0xFF059669),
    700: const Color(0xFF047857),
    800: const Color(0xFF065F46),
    900: const Color(0xFF064E3B),
  }),
  primaryColor: greenColor,
  scaffoldBackgroundColor: backgroundColor,
  cardColor: cardColor,
  dividerColor: borderColor,
  fontFamily: GoogleFonts.poppins().fontFamily,
  textTheme: TextTheme(
    displayLarge: h1TextStyle,
    displayMedium: h2TextStyle,
    displaySmall: h3TextStyle,
    headlineMedium: h4TextStyle,
    bodyLarge: bodyLargeTextStyle,
    bodyMedium: bodyMediumTextStyle,
    bodySmall: bodySmallTextStyle,
    labelLarge: buttonTextStyle,
    labelMedium: labelTextStyle,
    labelSmall: captionTextStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: greenColor,
      foregroundColor: whiteColor,
      textStyle: buttonTextStyle,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: greenColor,
      textStyle: buttonSecondaryTextStyle,
      side: BorderSide(color: greenColor, width: 1.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: greenColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: errorColor),
    ),
    filled: true,
    fillColor: whiteColor,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  cardTheme: CardTheme(
    color: cardColor,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.all(8),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: whiteColor,
    foregroundColor: blackColor,
    elevation: 1,
    titleTextStyle: h3TextStyle,
    iconTheme: IconThemeData(color: blackColor),
  ),
);

// Spacing Constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
}

// Border Radius Constants
class AppRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
  static const double xxl = 24.0;
}