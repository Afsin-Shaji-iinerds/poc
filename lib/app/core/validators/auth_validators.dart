import 'dart:developer';

enum PasswordStrength { weak, medium, strong }
class AuthValidator {

   static String? empty(String? value,String label) {
    log("$label called");
    if (value == null || value.isEmpty) {
      return 'Please enter your ${label.toLowerCase()}';
    }
     return null;
    }
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (value.trim().contains(RegExp(r'\s'))) {
    return 'Email must not contain spaces';
}
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one number
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // Check for at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null; // Password is valid
  }

  static PasswordStrength calculateStrength(String value) {
    int score = 0;

    if (value.length >= 8) {
      score++;
    }
    if (value.length >= 12) {
      score++; // bonus for extra length
    }
    if (RegExp(r'[A-Z]').hasMatch(value)) {
      score++;
    }
    if (RegExp(r'[a-z]').hasMatch(value)) {
      score++;
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      score++;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      score++;
    }

    if (score <= 2) {
      return PasswordStrength.weak;
    }
    if (score <= 4) {
      return PasswordStrength.medium;
    }
    return PasswordStrength.strong;
  }

  static String? createPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return '8 or more characters, must include at least 1 number and 1 character';
    }

    // // Check for at least one uppercase letter
    // if (!RegExp(r'[A-Z]').hasMatch(value)) {
    //   return 'Password must contain at least one uppercase letter';
    // }

    // Check for at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(value) && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one character';
    }

    // Check for at least one number
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // // Check for at least one special character
    // if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    //   return 'Password must contain at least one special character';
    // }

    return null; // Password is valid
  }

  static String? otp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter OTP';
    }
    if (value.length != 6) {
      return 'OTP must be 6 digits long';
    }
    return null;
  }
}