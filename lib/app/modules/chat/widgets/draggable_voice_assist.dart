import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/modules/voice_chat/view/pages/room.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';


class DraggableVoiceAssist extends StatefulWidget {
  const DraggableVoiceAssist({super.key});

  @override
  State<DraggableVoiceAssist> createState() => _DraggableVoiceAssistState();
}

class _DraggableVoiceAssistState extends State<DraggableVoiceAssist> {
 // Offset position = const Offset(265, 360); // Default position

  @override
  Widget build(BuildContext context) {
    return 
    // Positioned(
    //   left: position.dx,
    //   top: position.dy,
    //   child:
       GestureDetector(
        // onPanUpdate: (details) {
        //   setState(() {
        //     position += details.delta;
        //   });
        // },
        onTap: () => Get.to(() => RoomPage()),
        child: Container(
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(10),
          decoration:  const ShapeDecoration(
            // shadows: <BoxShadow>[
            //   // BoxShadow(
            //   //   // ignore: deprecated_member_use
            //   //   color: AppColorsNew.secondaryColor100.withOpacity(0.3),
            //   //   blurRadius: 5,
            //   //   //spreadRadius: 1,
            //   // )
            // ],
            shape: OvalBorder(),
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.71),
              end: Alignment(-0.06, 0.46),
              colors: <Color>[
                Color(0xFF8A51FF),
                Color(0xFF4F34FF),
                Color(0xFF6B3CFF),
              ],
            ),
          ),
          child: SvgPicture.asset(
            IconsConst.voiceAssistIcon,
          ),
        ),
    //  ),
    )
    ;
  }
}
