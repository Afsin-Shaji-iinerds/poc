import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/modules/chat/models/chat_message_model.dart';
import 'package:intl/intl.dart';

import '../../../common/const/assets_const/icon_const.dart';

import '../controllers/chat_controller.dart';
import '../widgets/chat_typing.dart';


class AfterChat extends GetView<ChatController> {
  const AfterChat({super.key});

  String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    // Dynamic sizes
    final double avatarSize = screenWidth * 0.10;
    final double bubbleRadius = screenWidth * 0.07;
    final double smallRadius = screenWidth * 0.015;
    final double bubblePadding = screenWidth * 0.04;
    final double bubbleSpacing = screenWidth * 0.025;
    final double textFontSize = screenWidth * 0.035;

    return Obx(() => ListView.builder(
          reverse: true,
          padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.025,
            horizontal: screenWidth * 0.03,
          ),
          itemCount: controller.chatList.length,
          itemBuilder: (BuildContext context, int index) {
            final ChatModel chat = controller.chatList[index];
            final bool isUser = chat.sender == "user";
            final bool isTyping = chat.sender == "typing";
            final DateTime time = chat.timestamp;
            final String senderName = chat.senderName ??
  (isUser
    ? "New".trim()
    : "Bot");




            return Padding(
              padding: EdgeInsets.symmetric(vertical: bubbleSpacing),
              child: Row(
                mainAxisAlignment: isUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 
                  Flexible(
                    child: Column(
                      crossAxisAlignment: isUser
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: <Widget>[
                        if (isUser)
                          Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()..rotateZ(3.14),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: bubblePadding,
                                vertical: screenWidth * 0.025,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFFE5CBF9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                   
                                    bottomLeft: Radius.circular(bubbleRadius),
                                    bottomRight: Radius.circular(bubbleRadius),
                                    topRight: Radius.circular(bubbleRadius),
                                  ),
                                ),
                              ),
                              child: Transform(
                                transform: Matrix4.identity()..rotateZ(3.14),
                                alignment: Alignment.center,
                                child: Text(
                                  chat.message,
                                  style: AppTextStylesNew.t4Regular.copyWith(
                                    color: Color(0xFF212121)
                                  ),
                                ),
                              ),
                            ),
                          )
                      else if (isTyping)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: bubblePadding,
                            vertical: screenWidth * 0.025,
                          ),
                          decoration: ShapeDecoration(
                            color: Color(0xFFE5CBF9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(smallRadius),
                                topRight: Radius.circular(bubbleRadius),
                                bottomLeft: Radius.circular(smallRadius),
                                bottomRight: Radius.circular(bubbleRadius),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                              
                                width: textFontSize * 1.2,
                                height: textFontSize * 1.2,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Color(0xFFFACC2E)),
                                child: Text("32",style: TextStyle(fontSize: 12.w,color: Color(0xFFFFFFFF)),),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "32bj AI is typing",
                                style: AppTextStylesNew.t4Regular.copyWith(
                                    color: Color(0xFF212121)
                                  ),
                              ),
                              const SizedBox(width: 6),
                              TypingDots(textFontSize: textFontSize),
                            ],
                          ),
                        )

                        else
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: bubblePadding,
                              vertical: screenWidth * 0.025,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5CBF9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(smallRadius),
                                  topRight: Radius.circular(bubbleRadius),
                                  bottomLeft:Radius.circular(smallRadius) ,
                                  bottomRight:Radius.circular(bubbleRadius) ,
                                ),
                              ),
                            ),
                            child: Text(
                              chat.message,
                              style: AppTextStylesNew.t4Regular.copyWith(
                                    color: Color(0xFF212121)
                                  ),
                            ),
                          ),

                        SizedBox(height: screenWidth * 0.015),

                        if (isUser) ...<Widget>[
                          Align(
                            alignment: Alignment.centerRight,  // 👈 forces left alignment
                            child: Text(
                              "$senderName ${formatTime(time)}",
                              style: AppTextStylesNew.t5Regular.copyWith(
                                    color: AppColorsNew.tertiaryColor400
                                  ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.03),
                        ] else if (!isTyping) ...<Widget>[
                          Text(
                            formatTime(time),
                            style: AppTextStylesNew.t5Regular.copyWith(
                                    color: AppColorsNew.tertiaryColor400
                                  ),
                          ),
                          SizedBox(height: screenWidth * 0.03),
                        ],
                      ],
                    ),
                  ),

                   if (isUser) ...<Widget>[
                    SizedBox(width: screenWidth * 0.02),
                    CircleAvatar(
                        radius: avatarSize / 2,
                        backgroundColor: Color(0xFF5A2D7E), // or any bg color you want
                        child: Text(
                      "TG", //   _getUserInitials(),
                          style: TextStyle(
                            fontSize: avatarSize * 0.4,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    
                  ],
                ],
              ),
            );
          },
        ));
  }
}



String capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1).toLowerCase();
}

// String _getUserInitials() {
//   final String firstName = UserDataService.user.firstName ?? '';
//   final String lastName = ew;

//   final String firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
//   final String lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';

//   return '$firstInitial$lastInitial';
// }
