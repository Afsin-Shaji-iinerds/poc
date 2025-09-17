import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';

import '../../../../../../common/const/assets_const/icon_const.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColorsNew.darkBackground500,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColorsNew.stroke),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(IconsConst.googleIcon, height: 26),
            ),
            Container(width: 1, height: 24, color: AppColorsNew.stroke),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(IconsConst.facebookIcon, height: 26),
            ),
          ],
        ),
      ),
    );
  }
}
