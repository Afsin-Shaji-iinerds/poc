import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/image_const.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/theme/theme.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import '../../../common/const/assets_const/icon_const.dart';
import '../controllers/chat_controller.dart';

class BeforeChat extends GetView<ChatController> {

  const BeforeChat({required this.screenHeight, super.key});
  final double screenHeight;

  Widget faqButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: InkWell(
        onTap: () => controller.sendMessage(text),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal:12, vertical: 9),
          decoration: BoxDecoration(
            color:  Color(0xFFE5CBF9),
            //border: Border.all(width: 0.3, color: AppColorsNew.stroke),
            borderRadius: BorderRadius.circular(5),
          ),
          child:  Text(
            text,
            style: AppTextStylesNew.t2Regular.copyWith(color: Color(0xFF212121)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: screenHeight * 0.015),
        Container(
          constraints: BoxConstraints(minHeight: screenHeight * 0.37),
          child: Align(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Image.asset(Images.chatBackground, height:158.w , width: 165.w),
                const SizedBox(height: 10),
                Text(
                  "Chat with 32bj AI",
                  style: AppTextStylesNew.h6Bold.copyWith( color: Color(0xFF5A2D7E),),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: Color(0xFFF4E6FF),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: Color(0xFFCBC1D9)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              faqButton("What is a 5 Star Center?"),
              faqButton("What do I pay when I use the Emergency Room?"),
              faqButton("How much will I pay for an eye exam and glasses?"),
            ],
          ),
        ),
          const SizedBox(height: 12),
      ],
    );
  }
}
