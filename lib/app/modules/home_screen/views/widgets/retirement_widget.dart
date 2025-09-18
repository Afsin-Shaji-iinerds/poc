import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class RetirementCard extends StatelessWidget {
  final String balance;
  final String savings;
  final VoidCallback onViewDetails;

  const RetirementCard({
    super.key,
    required this.balance,
    required this.savings,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF324762), // Full blue background
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Blue Header Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Retirement",
                        style: AppTextStylesNew.h5SemiBold.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Last Updated 09/15/2025",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.w,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    IconsConst.retirementIcon1,
                    width: 68,
                    height: 68,
                  ),
                ],
              ),
            ),
            // White Inner Container
            Padding(
              padding:  EdgeInsets.only(bottom:  12,left: 12,right: 12,),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    // Balance section
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              balance,
                              style: AppTextStylesNew.h4Bold.copyWith(
                                color: const Color(0XFF1A1A1A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Balance",
                              style: AppTextStylesNew.t1Regular.copyWith(
                                fontSize: 18.w,
                                fontWeight: FontWeight.w400,
                                color: const Color(0XFF747474),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Divider (with left-right margin)
                    const Divider(
                      height: 1,
                      color: Colors.black12,
                      indent: 16,
                      endIndent: 16,
                    ),

                    // Savings + View Details (same line)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child:Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    // Savings
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          savings,
          style: AppTextStylesNew.h4Bold.copyWith(
            color: const Color(0XFF1A1A1A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Savings",
          style: AppTextStylesNew.t1Regular.copyWith(
            fontSize: 18.w,
            fontWeight: FontWeight.w400,
            color: const Color(0XFF747474),
          ),
        ),
      ],
    ),

   // View Details + Arrow
GestureDetector(
  onTap: onViewDetails,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end, // right align arrow with text
    children: [
      SvgPicture.asset(
        IconsConst.arrowIcon1,
        width: 30,
        height: 30,
      ),
      const SizedBox(height: 4),
      const Text(
        "View Details",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0XFF5A2D7E),
        ),
      ),
    ],
  ),
),

  ],
)

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
