import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

import 'theme.dart';

class AppTextStyles {
  AppTextStyles._(); 

  // 🔧 Base builder for all text styles
  static TextStyle _base({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.textPrimaryLight,
      letterSpacing: -0.25,
    );
  }
  static TextStyle skipButtonTextStyle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontFeatures: <FontFeature>[const FontFeature.proportionalFigures()],
    height: 0.8,
  );

  static TextStyle onboardingDescription=GoogleFonts.inter(
              color: const Color(0xFFF3F3F3),
              fontSize: 32,
              fontWeight: FontWeight.w500,
              height: 1.32,
            );

  static TextStyle onboardingFooter=GoogleFonts.inter(
              color: const Color(0xFF999999),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.44,
            );

  static TextStyle appointmentTabStyle=GoogleFonts.inter(
              fontSize: 15.w,
              fontWeight: FontWeight.w400,
            );

  static TextStyle appointmentNotificationStyle=GoogleFonts.inter(color: Colors.white54);

  static TextStyle appointmentTextStyle=GoogleFonts.inter(
                  color: const Color(0xFFF3F3F3),
                  fontSize: 20.w,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                );
  
  static TextStyle appointmentDateTextStyle=GoogleFonts.inter(
                      color: const Color(0xFFDBDBDB),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      height: 0.60,
                    );
      
  static TextStyle appointmentDayStyle=GoogleFonts.inter(
                          color: const Color(0xFFDBDBDB),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        );

  static TextStyle rescheduleTextStyle=GoogleFonts.inter(
                          color: const Color(0xFF2092E5),fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.07,);

  static TextStyle joinTextStyle=GoogleFonts.inter(
                          color: const Color(0xFF0D1017),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          height: 0.89,
        );

  static TextStyle appointmentLabelTextStyle=GoogleFonts.inter(
                          color: const Color(0xFFDBDBDB),
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                    );

  static TextStyle appointmentSubLabelTextStyle=GoogleFonts.inter(
                          color: const Color(0xFF999999),
                          fontSize: 16, 
                          fontWeight: FontWeight.w400
                          );

  static TextStyle providerNameTextStyle=GoogleFonts.inter(
                          color: const Color.fromARGB(137, 181, 146, 146), 
                          fontSize: 13
                          );

  static TextStyle titleTextStyle= GoogleFonts.inter
                          (color: const Color(0xFFF3F3F3),
                          fontWeight: FontWeight.w500
                          );

  static TextStyle chatIconStyle=GoogleFonts.inter(
                          color: const Color(0xFFDBDBDB),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
  );
  static TextStyle dropStyle=GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            );
                      
  static TextStyle scheduleButtonStyle=GoogleFonts.inter(
                color: const Color(0xFFF3F3F3),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              );

  static TextStyle avatarStyle=GoogleFonts.inter(color:  const Color(0xFFDBDBDB),
                                          fontSize: 60,
                                          fontWeight: FontWeight.w700,
                                          height: 0.27,);

  static TextStyle dialingStyle=GoogleFonts.inter(color:const Color(0xFF999999),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.43,);

  static TextStyle primaryButtonStyle=GoogleFonts.inter(fontSize: 18.w,fontWeight: FontWeight.w600,color: Colors.white,letterSpacing: 0.5,);
  static TextStyle primaryTextStyle=GoogleFonts.inter(fontSize: 14,color: Colors.white,);

  static TextStyle otpMessageStyle=GoogleFonts.figtree(color:  const Color(0xFFDBDBDB),fontSize: 14,fontWeight: FontWeight.w400,);
  static TextStyle inputTextstyle=GoogleFonts.inter(color: AppColors.grey300, fontSize: 40.w,fontWeight:FontWeight.w500 );
static TextStyle authLabelTextStyle = GoogleFonts.inter(fontSize: 16.w, fontWeight: FontWeight.w400, color: AppColors.labelColor);
static TextStyle labelTextStyle = GoogleFonts.inter(fontSize: 15.w, fontWeight: FontWeight.w400, color: AppColors.labelColor);
 //AppTextStyles.t3Regular.copyWith(color: AppColors.tertiaryColor400)

  static TextStyle chatStyle=GoogleFonts.inter(
                                    color: const Color(0xFFDBDBDB),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
  );

  static TextStyle chatTimeStyle=GoogleFonts.inter(
                                color: const Color(0xFF999999),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.26,
                                height: 1.54,
  );
  static TextStyle todayReadingTitle = GoogleFonts.inter(
    color: const Color(0xFF141921),
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );
  static TextStyle todayReadingCategory = GoogleFonts.inter(
    color: const Color(0xFF7D7D7D),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
                        
/// A large 35 px headline in Inter w600, white200
static TextStyle get displayLarge600 => _base(
  fontSize: 35.w,
  fontWeight: FontWeight.w600,
  color: AppColors.white200,
);

  // 🎯 Headings
  static TextStyle get headlineLargeBold =>
      _base(fontSize: 28, fontWeight: FontWeight.bold,);

  static TextStyle get headlineLarge => _base(fontSize: 28,);

  static TextStyle get headlineLarge600 =>
      _base(fontSize: 28, fontWeight: FontWeight.w600);

  static TextStyle get headlineLarge700 =>
      _base(fontSize: 28, fontWeight: FontWeight.w700);

  static TextStyle get headlineMedium600 =>
      _base(fontSize: 24, fontWeight: FontWeight.w600);

  static TextStyle get headlineMedium => _base(fontSize: 24);

  static TextStyle get headlineSmallBold =>
      _base(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle get headlineSmall => _base(fontSize: 20);

  static TextStyle get headlineSmall500 =>
      _base(fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle get headlineSmall600 =>
      _base(fontSize: 20, fontWeight: FontWeight.w600);

  // 📄 Body text
  static TextStyle get bodyLarge => _base(fontSize: 16);

  static TextStyle get bodyLarge500 =>
      _base(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get bodyLarge600 =>
      _base(fontSize: 16, fontWeight: FontWeight.w600);
    static TextStyle get t3Regular => _base(fontSize: 15);

  static TextStyle get t3Medium =>
      _base(fontSize: 15, fontWeight: FontWeight.w500);

  static TextStyle get t3SemiBold =>
      _base(fontSize: 15, fontWeight: FontWeight.w600);
          static TextStyle get t5Regular => _base(fontSize: 13);

  static TextStyle get t5Medium =>
      _base(fontSize: 13, fontWeight: FontWeight.w500);

  static TextStyle get t5SemiBold =>
      _base(fontSize: 13, fontWeight: FontWeight.w600);

  static TextStyle get bodyLarge400 =>
      _base(fontSize: 15);

  static TextStyle get bodyMedium => _base(fontSize: 14);

  static TextStyle get bodyMedium500 =>
      _base(fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle get bodyMedium600 =>
      _base(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get bodySmall => _base(fontSize: 12);

  static TextStyle get bodyLargeBold =>
      _base(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle get bodyMediumBold =>
      _base(fontSize: 14, fontWeight: FontWeight.bold);

  static TextStyle get bodySmallBold =>
      _base(fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle get bodySmall500 =>
      _base(fontSize: 12, fontWeight: FontWeight.w500);

  // 🔘 Buttons
  static TextStyle get buttonText =>
      _base(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);

  static TextStyle get textButtonStyle =>
      _base(fontSize: 16,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF3D5E4B));

  static TextStyle mainHeadingTextStyle = GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF3F3F3),
              height: 1.50,);
  static TextStyle activeTabTextStyle = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3), 
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle profileHeadingTextStyle = GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 20, color: const Color(0xFFF3F3F3));
  static TextStyle profileCardName = GoogleFonts.inter(color: const Color(0xFFF3F3F3), fontWeight: FontWeight.w700, fontSize: 22);
  static TextStyle profileCardDescTextStyle = GoogleFonts.inter(color: const Color(0xFFF3F3F3), fontSize: 16, fontWeight: FontWeight.w400);
  static TextStyle profileRPMTextStyle = GoogleFonts.inter(color: const Color(0xFF9A86E2), fontWeight: FontWeight.w500, fontSize: 14);
  static TextStyle profileViewMedHistory = GoogleFonts.inter(
                      color: const Color(0xFF339CFF),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFF339CFF),
                      decorationThickness: 1.3,
                    );
  static TextStyle profilePrescTextStyle = GoogleFonts.inter(color: const Color(0xFF2092E5), fontSize: 15, fontWeight: FontWeight.w500);
  static TextStyle profileLabelStyle = GoogleFonts.inter(color: const Color(0xFF999999), fontSize: 15, fontWeight: FontWeight.w400);
  static TextStyle profileValueStyle = GoogleFonts.inter(color: const Color(0xFFF3F3F3), fontSize: 15, fontWeight: FontWeight.w500);
  static TextStyle profileSettingsStyle = GoogleFonts.inter(color: const Color(0xFF999999), fontSize: 16);
  static TextStyle inActiveTabTextStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle historyPageTextStyle = GoogleFonts.inter(
    color: const Color(0xFF999999)
  );
  static TextStyle medTitleTextStyle = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ); 
  static TextStyle medTimeTextStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
   static TextStyle medLabelTextStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 12,
  );
  static TextStyle medValueTextStyle = GoogleFonts.inter(
    color: const Color(0xFFDBDBDB),
    fontSize: 12,
  );
  static TextStyle moreGridLabelTextStyle = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle titleW3F22 = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 22.w,
    fontWeight: FontWeight.w300,

  );
  static TextStyle titleW7F22 = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 22.w,
    fontWeight: FontWeight.w700,

  );
  static TextStyle titleW4F22 = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 22.w,
    fontWeight: FontWeight.w400,

  );
  static TextStyle customTextFieldHint = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.hintColor,
    fontFeatures: <FontFeature>[const FontFeature.proportionalFigures()],
  );
  static TextStyle cardTextStyle=GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    shadows: <Shadow>[
      const Shadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color.fromRGBO(0, 0, 0, 0.25),
      ),
    ],
  );
  static TextStyle titleWhiteS20W6 = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 20.w,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.25,
    letterSpacing: -0.2,
  );
  static TextStyle textGreyS16W4 = GoogleFonts.inter(
    color: AppColors.greyColor,
    fontSize: 16.w,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: -0.32,
  );
  static TextStyle textGreyS22W3 = GoogleFonts.inter(
    color: AppColors.greyColor,
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    height: 0.90909,
    letterSpacing: -0.44,
  );
  static TextStyle pollenIndexCardTitle = GoogleFonts.inter(
    color: AppColors.darkGreenColor,
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
  static TextStyle titleWhiteS16W5 = GoogleFonts.inter(
    color: const Color(0xFFDBDBDB),
    fontSize: 16.w,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,

  );
  static TextStyle titleWhiteS24W5 = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 26.w,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );
  static TextStyle greyTextS15W4 = GoogleFonts.inter(
    color: AppColors.greyColor,
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.25,
      letterSpacing: -0.32
  );
  static TextStyle contentStyle = GoogleFonts.inter(
      color: const Color(0xFFDBDBDB),
      fontSize: 15,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      height: 1.33,
  );
  static TextStyle reminderLineThroughContentStyle = GoogleFonts.inter(
    color: const Color(0xFF67CF65),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    height: 1.25,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle reminderContentStyle = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    height: 1.25,
  );
  static TextStyle reminderLineThroughTimeStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: -0.32,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle reminderTimeStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    height: 1.25,
    letterSpacing: -0.32,
  );
  static TextStyle appointmentTitleStyle = GoogleFonts.inter(
      color: const Color(0xFFF3F3F3),
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      height: 1.0
  );
  static TextStyle vitalCardTextStyle = GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    letterSpacing: -0.32,
    height: 1.0,
  );
  static TextStyle textStyleS24W7 = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );
  static TextStyle textStyleS14W5 = GoogleFonts.inter(
    color: const Color(0xFFB2B2B2),
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );
  static TextStyle textStyleS12W4 = GoogleFonts.inter(
    color: const Color(0xFFB2B2B2),
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );
  static TextStyle textStyleS13W6 = GoogleFonts.inter(
    color: const Color(0xFF04803A),
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0, // line-height: normal
  );
  static TextStyle textStyleS10W6 = GoogleFonts.inter(
    color: Colors.white, // #FFF
    fontSize: 10,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    height: 1.0, // line-height: normal
    letterSpacing: -0.3,
  );
  static TextStyle textStyleS18W5 = GoogleFonts.inter(
    color: const Color(0xFFF3F3F3),
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    height: 1.0,
  );
  static TextStyle textStyleS14W4= GoogleFonts.inter(
    color: const Color(0xFF999999),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    height: 1.43,
  );
  static TextStyle textStyleS14W6= GoogleFonts.inter(
    color: const Color(0xFF04803A),
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.0,
  );
  static TextStyle textStyleS18W6= GoogleFonts.inter(
    color: const Color(0xFF141921),
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    height: 1.0,
  );

}