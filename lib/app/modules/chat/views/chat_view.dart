import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/widgets/bottom_nav.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/theme.dart';
import 'package:funds_32bj_poc/app/modules/chat/widgets/draggable_voice_assist.dart';

import '../controllers/chat_controller.dart';
import '../widgets/after_chat.dart';
import '../widgets/before_chat.dart';
import '../widgets/chat_footer.dart';
import '../widgets/chat_header.dart';


class ChatView extends GetView<ChatController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final ChatController controller = Get.put(ChatController());

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(16),
//                   border: Border.all(color: AppColors.borderGrey1,width: 0.30,
// ),
                  
                ),
child: Obx(() {
  return Stack(
    children: [
      Column(
        children: <Widget>[
          const ChatHeader(),
          const Divider(color: AppColorsNew.stroke, thickness: 0.50, height: 1),
          Expanded(
            child: controller.isChatStarted.value
                ? const AfterChat()
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: BeforeChat(screenHeight: screenHeight),
                  ),
          ),
          const SizedBox(height: 12),
          const ChatFooter(),
        ],
      ),
      
    ],
  );
}),

              // ),
              //   ),
              // child: Obx(() {
              //   return Column(
              //     children: <Widget>[
              //       const ChatHeader(),
              //       const Divider(color: AppColorsNew.stroke, thickness: 0.7, height: 1),
              //       Expanded(
              //   child: controller.isChatStarted.value
              //       ? const AfterChat()
              //       : SingleChildScrollView(
              //           padding: const EdgeInsets.only(top: 20),
              //           child: BeforeChat(screenHeight: screenHeight),
              //         ),
              // ),
              //       const SizedBox(height: 12),
              //       const ChatFooter(),
              //     ],
              //   );
              // }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    bottomNavigationBar: const CustomBottomNav(currentIndex: 1),
                  );
                }
              }
