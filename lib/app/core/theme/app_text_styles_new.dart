import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

import 'app_colors_new.dart';

class AppTextStylesNew {
  AppTextStylesNew._();

  // 🔧 Base builder for all text styles
  static TextStyle _base({
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColorsNew.textPrimary,
      letterSpacing: -0.25,
    );
  }

  //Heading
  static TextStyle get hBold => _base(fontSize: 48.w, fontWeight: FontWeight.w700);
  static TextStyle get hSemiBold => _base(fontSize: 50.w, fontWeight: FontWeight.w600);
  //H1
  static TextStyle get h1Bold => _base(fontSize: 25.w, fontWeight: FontWeight.bold);
  static TextStyle get h1Light => _base(fontSize: 25.w, fontWeight: FontWeight.w300);
  static TextStyle get h1Bold700 => _base(fontSize: 25.w, fontWeight: FontWeight.w700);
  
  static TextStyle get h1Regular => _base(fontSize: 25.w, fontWeight: FontWeight.w400);
 
  //H2
  static TextStyle get h2Medium => _base(fontSize: 40.w, fontWeight: FontWeight.w500);
  //H3
  static TextStyle get h3SemiBold => _base(fontSize: 35.w, fontWeight: FontWeight.w600);
  //H4
  static TextStyle get h4Medium => _base(fontSize: 26.w, fontWeight: FontWeight.w500);
  static TextStyle get h4Bold => _base(fontSize: 26.w, fontWeight: FontWeight.w700);
  //H5
  static TextStyle get h5Large => _base(fontSize: 22.w, fontWeight: FontWeight.w300);
  static TextStyle get h5Medium => _base(fontSize: 22.w, fontWeight: FontWeight.w500);
  static TextStyle get h5Bold => _base(fontSize: 22.w, fontWeight: FontWeight.bold);
   static TextStyle get h5SemiBold => _base(fontSize: 22.w, fontWeight: FontWeight.w600);
  //H6
  static TextStyle get h6Medium => _base(fontSize: 20.w, fontWeight: FontWeight.w500);
  static TextStyle get h6Regular => _base(fontSize: 20.w, fontWeight: FontWeight.w400);
  static TextStyle get h6SemiBold => _base(fontSize: 20.w, fontWeight: FontWeight.w600);
  static TextStyle get h6Bold => _base(fontSize: 20.w, fontWeight: FontWeight.bold);


  //Text1
  static TextStyle get t1Regular => _base(fontSize: 18.w, fontWeight: FontWeight.w400);
  static TextStyle get t1Medium => _base(fontSize: 18.w, fontWeight: FontWeight.w500);
  static TextStyle get t1SemiBold => _base(fontSize: 18.w, fontWeight: FontWeight.w600);
  //Text2
  static TextStyle get t2Light => _base(fontSize: 16.w, fontWeight: FontWeight.w300);
  static TextStyle get t2Regular => _base(fontSize: 16.w, fontWeight: FontWeight.w400);
  static TextStyle get t2Medium => _base(fontSize: 16.w, fontWeight: FontWeight.w500);
  static TextStyle get t2SemiBold => _base(fontSize: 16.w, fontWeight: FontWeight.w600);
  //Text3
  static TextStyle get t3Regular => _base(fontSize: 15.w, fontWeight: FontWeight.w400);
  static TextStyle get t3Medium => _base(fontSize: 15.w, fontWeight: FontWeight.w500);
  static TextStyle get t3SemiBold => _base(fontSize: 15.w, fontWeight: FontWeight.w600);
  //Text4
  static TextStyle get t4Light => _base(fontSize: 14.w, fontWeight: FontWeight.w300);
  static TextStyle get t4Regular => _base(fontSize: 14.w, fontWeight: FontWeight.w400);
  static TextStyle get t4Medium => _base(fontSize: 14.w, fontWeight: FontWeight.w500);
  static TextStyle get t4SemiBold => _base(fontSize: 14.w, fontWeight: FontWeight.w600);
  //Text5
  static TextStyle get t5Medium => _base(fontSize: 13.w, fontWeight: FontWeight.w500);
  static TextStyle get t5Regular => _base(fontSize: 13.w, fontWeight: FontWeight.w400);
  static TextStyle get t5SemiBold => _base(fontSize: 13.w, fontWeight: FontWeight.w600);
  //Text6
  static TextStyle get t6Regular => _base(fontSize: 12.w, fontWeight: FontWeight.w400);
  static TextStyle get t7Regular => _base(fontSize: 11.w, fontWeight: FontWeight.w400);


}