import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_new_colors.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class QuickActionWidget extends StatelessWidget {
  const QuickActionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionItem(
            icon: IconsConst.doctorIcon,
            label: "Find a\nDoctors",
            onTap: () {},
          ),
          _VerticalDivider(),
          _ActionItem(
            icon: IconsConst.dentistIcon,
            label: "Find a\nDentists",
            onTap: () {},
          ),
          _VerticalDivider(),
          _ActionItem(
            icon: IconsConst.trainingIcon,
            label: "Enroll in\nTraining",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const _ActionItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // left-align icon + text
          children: [
            // Icon at top-left
            SvgPicture.asset(icon, width: 48.w, height: 48.w),
            SizedBox(height: 8.h),

            // Text + Arrow in a row at bottom
            Row(
              crossAxisAlignment: CrossAxisAlignment.end, // align arrow with text bottom
              children: [
                // Text label
                Expanded(
                  child: Text(
                    label,
                    style: AppTextStylesNew.h6Regular.copyWith(
                      fontSize: 14,
                      color: AppNewColors.primaryColor300,
                    ),
                  ),
                ),

                // Arrow icon at bottom-right
                SvgPicture.asset(IconsConst.arrow1, width: 16.w),

                // Gap between arrow and divider
                SizedBox(width: 10.w),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w), // gap on left & right
      child: Container(
        width: .5.w,
        height: 100.h,
        color: Color(0XFFC0C0C0),
      ),
    );
  }
}
