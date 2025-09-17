import 'package:flutter/material.dart';
import 'app_text_styles.dart';
InputDecoration defaultDecoration({required String hintLabel,double verticalPadding=0.0}) {
  return
    InputDecoration(
      fillColor: Colors.white,
      filled: true,
      contentPadding:  EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 10),
      counterText: '',

      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        borderSide: BorderSide(
          width: 0.7,
          color: Color(0xFFC8C8C8),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        borderSide: BorderSide(
          width: 0.7,
          color: Color(0xFFC8C8C8),
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        borderSide: BorderSide(width: 0.7, color: Color(0xFFC8C8C8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        borderSide: BorderSide(width: 0.7, color: Color(0xFFC8C8C8)),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        borderSide: BorderSide(width: 0.7, color: Color(0xFFC8C8C8)),
      ),
      counterStyle: const TextStyle(height: 0, fontSize: 0),
      hintText: hintLabel,
      hintStyle: AppTextStyles.customTextFieldHint.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          // height: 1.58,
          color: const Color(0xFFB1B1B1)),
    );
}
