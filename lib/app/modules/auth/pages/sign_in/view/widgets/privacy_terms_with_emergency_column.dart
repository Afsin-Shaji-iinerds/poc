
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/common/const/feature_const/auth_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/widgets/emergency_911_widget.dart';


class PrivacyTermsWithEmergencyColumn extends StatelessWidget {
  const PrivacyTermsWithEmergencyColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // Main
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: AuthConst().agreeTo,
                style:
                    AppTextStylesNew.t4Regular.copyWith(color: Color(0XFF656565) ),
                children: <InlineSpan>[
                  TextSpan(
                    text: AuthConst().termsOfService,
                    style: AppTextStylesNew.t4Regular
                        .copyWith(color: Color(0XFF2D68C7) ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: AuthConst().and,
                    style: AppTextStylesNew.t4Regular
                        .copyWith(color: Color(0XFF656565) ),
                  ),
                  TextSpan(
                    text: AuthConst().privacyPolicy,
                    style: AppTextStylesNew.t4Regular
                        .copyWith(color: Color(0XFF2D68C7) ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        // SizedBox(height: 23.h),
        // const Emergency911Widget(),
      ],
    );
  }
}
