
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class Emergency911Widget extends StatelessWidget {
  const Emergency911Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 19.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColorsNew.stroke, width: 0.5),
            color: AppColorsNew.darkBackground700,
            borderRadius: BorderRadius.circular(8.h)),
        child: RichText(
          text: TextSpan(
            text: 'In case of emergency, ',
            style: AppTextStylesNew.t5SemiBold.copyWith(
              color: AppColorsNew.tertiaryColor600,
            ),
            children: <InlineSpan>[
              TextSpan(
                text: 'Call 911',
                style: AppTextStylesNew.t5SemiBold.copyWith(
                  color: AppColorsNew.alertHighColor,
                ),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
