import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';


import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

class CommonHeaderWidget extends StatelessWidget {
   CommonHeaderWidget({
    required this.title, super.key,
    this.showCalendarIcon = true,
    this.showPatientIcon = true,
    this.showBellIcon = true,
    this.showProfilePic = true,
    this.showBackArrow = false,
    this.isFromHome=false,
    this.onCalendarTap,
    this.onPatientTap,
    this.onBellTap,
    this.onProfileTap,
    this.onBackTap,
  });

  final String title;
  final bool showCalendarIcon;
  final bool showPatientIcon;
  final bool showBellIcon;
  final bool showProfilePic;
  final bool showBackArrow;
  final VoidCallback? onCalendarTap;
  final VoidCallback? onPatientTap;
  final VoidCallback? onBellTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onBackTap;
  final bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
      Row(
        children: [
          if (showBackArrow)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackTap ?? () => Get.back(),
            ),
      isFromHome?
       SizedBox(
        width: 280.w,
         child: Text.rich(maxLines: 1,
         overflow: TextOverflow.ellipsis,
              TextSpan(
                children: <InlineSpan>[
                   TextSpan(text: 'Hello ', style: AppTextStylesNew.h1Light),
                  TextSpan(text: title, style: AppTextStylesNew.h1Bold,),
              
                ],
              ),
            ),
       )
      :    Text(
            title,
            style: AppTextStylesNew.h6Bold,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),



        Row(
          children: <Widget>[
            if (showCalendarIcon)
              InkWell(
          
                child: SvgPicture.asset(IconsConst.calenderIcon2),
              ),
            if (showCalendarIcon) SizedBox(width: 25.w),

            if (showPatientIcon)
              InkWell(
                onTap: onPatientTap,
                child: SvgPicture.asset(IconsConst.patientIcon),
              ),
            if (showPatientIcon) SizedBox(width: 25.w),

            if (showBellIcon)
              Container(
                width: 42.w,
                height: 42.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColorsNew.darkBackground500,
                  border: Border.all(color: AppColorsNew.stroke, width: 0.3),
                ),
                child: Center(child: SvgPicture.asset(IconsConst.bell)),
              ),
            if (showBellIcon) SizedBox(width: 25.w),

            if (showProfilePic)
              GestureDetector(
             
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColorsNew.gradient1, AppColorsNew.gradient2],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: 
                       Text(
                     "NU",
                        style: const TextStyle(
                          color: AppColorsNew.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                ),
              ),
          ],
        ),
      ],
    );
  }
}

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

