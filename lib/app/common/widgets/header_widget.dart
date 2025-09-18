import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/image_const.dart';
import 'package:get/get.dart';

import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_new_colors.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

class CommonHeaderWidget extends StatelessWidget {
  const CommonHeaderWidget({
    required this.userName,
    super.key,
    this.greeting = "Good Morning,",
    this.onBellTap,
    this.onProfileTap,
  });

  final String userName;
  final String greeting;
  final VoidCallback? onBellTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Profile icon + text
        Row(
          children: [
            GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 53,
                height: 53,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Image.asset(
                  Images.profileImage1, // your SVG profile icon
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),

            // Greeting and Name stacked
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  greeting,
                  style: AppTextStylesNew.h6Regular.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColorsNew.textSecondary,
                  ),
                ),
                Text(
                  userName,
                  style: AppTextStylesNew.h6Bold.copyWith(
                    fontSize: 28.w,
                    fontWeight: FontWeight.w600,
                    color: AppColorsNew.darkBackground500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),

        // Bell icon
        GestureDetector(
  onTap: onBellTap,
  child: Container(
    width: 42.w,
    height: 42.w,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        SvgPicture.asset(
          IconsConst.notificationsIcon1,
          width: 24,
          height: 24,
        ),

        // Yellow dot attached to bell
        Positioned(
          top: -1,   // adjust this to stick exactly to bell edge
          right: -1, // adjust for best overlap
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Color(0xFFFFAC00), // yellow
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  ),
)


      ],
    );
  }
}
