import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class TypingDots extends StatelessWidget {
  const TypingDots({required this.textFontSize, super.key});
  final double textFontSize;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.twistingDots(
          leftDotColor: AppColorsNew.stroke,
          rightDotColor: AppColorsNew.primaryColor500,
      size: textFontSize * 2.2, 
    );
  }
}
