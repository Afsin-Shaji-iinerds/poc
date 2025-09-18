import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

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
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text.rich(
  TextSpan(
    children: [
      const TextSpan(
        text: "Your Plan:\n",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Color(0XFF747474),
        ),
      ),
      TextSpan(
        text: planName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500, // bolder
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
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: onViewIdCards,
            child: const Text(
              "View ID Cards",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0XFF4445A9),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Container(
            height: 18,
            width: 1,
                color: Color(0XFF4445A9),
          ),
        ],
      ),
      GestureDetector(
        onTap: onManageDependents,
        child: const Text(
          "Manage dependents (1)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
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
                const TextSpan(
                  text: "TIP: New in 2025! 32BJ Health Fund \nCenters of Excellence (COE) for Surgery.\n",
                  style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
                ),
               WidgetSpan(
  child: GestureDetector(
    onTap: onSeeMore,
    child: const Text(
      "See more",
      style: TextStyle(
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
