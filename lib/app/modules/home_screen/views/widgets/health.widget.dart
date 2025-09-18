import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class HealthCard extends StatelessWidget {
  final String planName;
  final VoidCallback onViewIdCards;
  final VoidCallback onManageDependents;
  final VoidCallback onSeeMore;

  const HealthCard({
    super.key,
    required this.planName,
    required this.onViewIdCards,
    required this.onManageDependents,
    required this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Card(
        color: Colors.white,
       elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),side: BorderSide(color: Color(0XFFC5C5C5),width: 0.7.w)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with icon + plan
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Replace with your health icon
                  SvgPicture.asset(
                    IconsConst.healthIcon1,
                    width: 57,
                    height: 57,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          "Health",
                          style: AppTextStylesNew.h6Medium.copyWith(
                            color: Color(0XFF1A1A1A),
                          ),
                        ),
                         SizedBox(height: 10.w),
                        Text.rich(
  TextSpan(
    children: [
       TextSpan(
        text: "Your Plan:\n",
        style:  AppTextStylesNew.t3Regular.copyWith(
    
          color: Color(0XFF747474),
        ),
      ),
      TextSpan(
        text: planName,
        style:  AppTextStylesNew.t2Medium.copyWith(
           
          color: Color(0XFF5A2D7E),   // darker
        ),
      ),
    ],
  ),
),

                      ],
                    ),
                  ),
                ],
              ),
            ),

              const Divider(
                      height: 1,
                      color: Colors.black12,
                      indent: 16,
                      endIndent: 16,
                    ),
            // Buttons row
            SizedBox(height:10),

            Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onViewIdCards,
            child:  Text(
              "View ID Cards",
              style:  AppTextStylesNew.t2Medium.copyWith(
          
                color: Color(0XFF4445A9),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 18,
            width: 1,
                color: Color(0XFF4445A9),
          ),
        ],
      ),
      const SizedBox(width: 20),
      GestureDetector(
        onTap: onManageDependents,
        child:  Text(
          "Manage dependents (1)",
          style:  AppTextStylesNew.t2Medium.copyWith(
     
            color: Color(0XFF4445A9),
          ),
        ),
      ),
    ],
  ),
),
SizedBox(height:10),

      // Highlighted notice (separate rectangle inside card)
Padding(
  padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: const Color(0XFF6A6BBE), // light purple
      borderRadius: BorderRadius.circular(8), // rounded on all sides
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SvgPicture.asset(IconsConst.lightIcon1, width: 37, height: 37, ),
        const SizedBox(width: 8),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                 TextSpan(
                  text: "TIP: New in 2025! 32BJ Health Fund \nCenters of Excellence (COE) for Surgery.\n",
                  style:  AppTextStylesNew.t4Medium.copyWith( color: Colors.white, ),
                ),
               WidgetSpan(
  child: GestureDetector(
    onTap: onSeeMore,
    child:  Text(
      "See more",
      style:  AppTextStylesNew.t4Medium.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0XFFFCCC2F),
        decoration: TextDecoration.underline,
        decorationColor: Color(0XFFFCCC2F), // underline matches text color
        decorationThickness: 1.5,           // slightly thicker line
        decorationStyle: TextDecorationStyle.solid,
      ),
    ),
  ),
),

              ],
            ),
          ),
        ),
      ],
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}
