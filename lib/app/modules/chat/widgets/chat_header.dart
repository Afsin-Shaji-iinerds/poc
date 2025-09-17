import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/modules/chat/widgets/draggable_voice_assist.dart';

import '../../../common/const/assets_const/icon_const.dart';
//import '../../../routes/app_pages.dart';
import '../controllers/chat_controller.dart';

class ChatHeader extends GetView<ChatController> {
  const ChatHeader({super.key, this.isInCall = false});
  final bool isInCall;

  @override
  Widget build(BuildContext context) {
    final Color callIconBgColor = isInCall ?  AppColorsNew.alertLowColor :  AppColorsNew.tertiaryColor700;
    final Color callIconColor = isInCall ?  AppColorsNew.darkBackground500 : Colors.white;

    return Container(
     decoration: ShapeDecoration(
       color: Color(0xFF5A2D7E),
         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
     ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// Avatar with status
            Stack(
              children: <Widget>[
                Container(
                  width: 42,
                  height: 42,
                  decoration: const ShapeDecoration(
                    shape: OvalBorder(),
                    color: Color(0xFFFACC2E),
                    // gradient: LinearGradient(
                    //   colors: <Color>[AppColorsNew.gradient1, AppColorsNew.gradient2],
                    // ),
                  ),
                  child: Align(
                    child:Text("32",style: AppTextStylesNew.h6Bold.copyWith(
                color: Color(0xFFFFFFFF),
                    ),)
                    
                    //  SvgPicture.asset(
                    //   IconsConst.chatbotIcon,
                    //   width: 30,
                    //   height: 30,
                    // ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const ShapeDecoration(
                      color: AppColorsNew.alertLowColor,
                      shape: OvalBorder(),
                    ),
                  ),
                ),
              ],
            ),
      
            /// Call buttons
            Row(
              children: <Widget>[
                //voice assist
                const DraggableVoiceAssist(),
                // InkWell(
                //   onTap: ()=>Get.toNamed(Routes.VOICE_CHAT),
      
                 
                //   child: Container(
                //     width: 42,
                //     height: 42,
                //     padding: const EdgeInsets.all(8),
                //     decoration: const BoxDecoration(
                //       color:  Color(0xFF383E4A),
                //       shape: BoxShape.circle,
                //     ),
                //     child: SvgPicture.asset(
                //       IconsConst.voiceAssistIcon,
                //       color: AppColorsNew.primaryColor500,
                //     ),
                //   ),
                // ),
                //  SizedBox(width: 40.w),
                /// Voice Call
                // GestureDetector(
                //   onTap: controller.skipToVoiceCall,
                //   child: Container(
                //     width: 42,
                //     height: 42,
                //     padding: const EdgeInsets.all(11),
                //     decoration: BoxDecoration(
                //       color: callIconBgColor,
                //       shape: BoxShape.circle,
                //     ),
                //     child: SvgPicture.asset(
                //       IconsConst.callIcon,
                //       color: callIconColor,
                //     ),
                //   ),
                // ),
      
                //  SizedBox(width: 18.w),
      
                /// Video Call
                // GestureDetector(
                //   onTap: controller.skipToVideoCall,
                //   child: SvgPicture.asset(
                //     IconsConst.videoCallIcon,
                //     width: 42,
                //     height: 42,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
