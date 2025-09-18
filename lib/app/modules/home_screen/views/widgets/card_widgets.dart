import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class InfoCard extends StatelessWidget {
  final Color bgColor;
  final String icon; // path to your svg (from IconConst)
  final String title;
  final String description;
  final VoidCallback onTap;

  const InfoCard({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12), // left & right padding
      child: SizedBox(
        height: 143.w, // fixed height with size_util scaling
        child: Card(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    height: 130.w,
                    width: 92.w,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      icon, // ✅ use Svg asset instead of Icon()
                      width: 50.w,
                      height: 50.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center, // centers vertically
                      children: [
                        Text(
                          title,
                          style:  TextStyle(
                            fontSize: 20.w,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF1A1A1A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          description,
                          style:  TextStyle(
                            fontSize: 15.w,
                            fontWeight: FontWeight.w400,
                            color: Color(0XFF5D5D5D),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Explore",
                          style: TextStyle(
                            fontSize:15.w,
                            color: Color(0XFF5A2D7E),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
