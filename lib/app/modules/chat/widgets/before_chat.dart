import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:  AppColorsNew.darkBackground500,
            border: Border.all(width: 0.3, color: AppColorsNew.stroke),
            borderRadius: BorderRadius.circular(5),
          ),
          child:  Text(
            text,
            style: AppTextStylesNew.t2Regular.copyWith(color: AppColorsNew.tertiaryColor300),
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
                SvgPicture.asset(IconsConst.chatbotIcon, height: 96, width: 96),
                const SizedBox(height: 10),
                Text(
                  "Chat with AI",
                  style: AppTextStylesNew.t1Regular.copyWith(color: AppColorsNew.tertiaryColor300),
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
            color: AppColorsNew.darkBackground600,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: AppColorsNew.stroke),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              faqButton("I missed a dose. What should I do now?"),
              faqButton("Can I take this medication with food?"),
              faqButton("I have a mild headache. Is this a side effect of my medication?"),
            ],
          ),
        ),
      ],
    );
  }
}
