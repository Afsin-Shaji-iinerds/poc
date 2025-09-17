// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/theme/theme.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import '../../../common/const/assets_const/icon_const.dart';
import '../controllers/chat_controller.dart';

class ChatFooter extends GetView<ChatController> {
  const ChatFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return SizedBox(
      height: 60,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: const ShapeDecoration(
          color: AppColorsNew.darkBackground700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Type your message here",
                  hintStyle: AppTextStylesNew.t2Regular.copyWith(color: AppColorsNew.tertiaryColor400),
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(color: AppColorsNew.textPrimary),
              ),
            ),
           // SvgPicture.asset(IconsConst.attachmentIcon, color: AppColorsNew.secondaryColor200),
            // const SizedBox(width: 20),
            // SvgPicture.asset(IconsConst.microphoneIcon, color: AppColorsNew.secondaryColor200),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                controller.sendMessage(textController.text);
                textController.clear();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  color: AppColorsNew.tertiaryColor700,
                  shape: OvalBorder(
                    side: BorderSide(color: AppColorsNew.tertiaryColor700),
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    IconsConst.sendIcon,
                    color: AppColorsNew.textPrimary,
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
