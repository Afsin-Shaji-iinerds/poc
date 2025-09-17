import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'theme.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
       secondary: AppColors.secondaryColor,
    ),
    textTheme: GoogleFonts.onestTextTheme().copyWith(
      headlineLarge: AppTextStyles.headlineLargeBold,
      headlineMedium: AppTextStyles.headlineMedium600,
      headlineSmall: AppTextStyles.headlineSmallBold,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.buttonText,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor, // Button text color
      ),
    ),

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryDark,
      surface: Colors.black,
      onSecondary: Colors.white,
    ),
    textTheme: GoogleFonts.onestTextTheme().copyWith(
      headlineLarge: AppTextStyles.headlineLargeBold.copyWith(color: Colors.white),
      headlineMedium:
      AppTextStyles.headlineMedium600.copyWith(color: Colors.white),
      headlineSmall: AppTextStyles.headlineSmallBold.copyWith(color: Colors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.white),
      labelLarge: AppTextStyles.buttonText,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primaryDark,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryColor, // Button text color
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.borderDark,), // Set border color here
      ),
    ),
  );
}
