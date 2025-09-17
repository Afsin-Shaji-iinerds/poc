class AuthConst {

  // Factory constructor
  factory AuthConst() {
    return _instance;
  }
  AuthConst._internal();

  // Single instance
  static final AuthConst _instance = AuthConst._internal();
  String signIn = 'Sign In';
  String signUp = "Sign Up";
  String emailLabel = "Email ID";
  String confirmPasswordLabel = "Confirm Password";
  String signUpSocialLabel = "Or Sign Up in with";
  String passwordLabel = "Password";
  String stayLoggedIn = "Stay logged in";
  String orSigninWith = "Or Sign in with";
  String faceDetectionLabel = "Sign in with Face Id";
  String biometricDetectionLabel = "Sign in with Biometric";
  String enterOtp = "Enter OTP";
  String emailSentTo = "An email has been sent to";
  String didntRecieve = "Didn't receive?";
  String resendOtp = "Resend OTP";
  String submit = "Submit" ;
  String agreeTo = 'By continuing, you agree to our\n';
  String termsOfService = 'Terms of Service ';
  String and = 'and';
  String privacyPolicy = ' Privacy Policy';
  String forgotPassword = 'Forgot Password?';
  String sentFreshMail = "We’ve sent a fresh OTP to your email";
  String enterRegisteredEmailLabel = 'Enter your registered email ID';
  String confirmMail = 'Confirm Mail';
  String resetPassword = 'Reset Password';
   String passwordChangedSuccess = 'Your password has been changed successfully';
  String goToSignIn = 'Go to Sign in';
    // Navigation
  String back = 'Back';

  // Forgot Password flow titles & subtitles
  String newPasswordTitle = 'New Password';
  String newPasswordSubtitle = 'Enter new password';
  String forgotPasswordTitle = 'Forgot Password';
  String forgotPasswordEmailSubtitle =
      'Please enter your email to receive a confirmation code to set a new password.';
  String verifyEmailTitle = 'Verify email address';
   String verify="Verify";
}
