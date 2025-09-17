import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/modules/chat/views/chat_view.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/home_screen_view.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';



class CustomBottomNav extends StatelessWidget {

  const CustomBottomNav({
    required this.currentIndex, super.key,
  });
  final int currentIndex;

  void _onItemTapped(int index) {
    if (index == currentIndex) {
      return;
    }

    switch (index) {
      case 0:
        Get.off(HomeScreenView());
        break;
      case 1:
   
        Get.off(ChatView());
        break;
      
    }
  }

  @override
Widget build(BuildContext context) {
  final List<Map<String, String>> items = <Map<String, String>>[
    <String, String>{'image': IconsConst.homeNavIcon, 'label': 'Home'},
    <String, String>{'image': IconsConst.chatNavIcon, 'label': 'Chat'},

  ];

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 12), // Only top-bottom padding if needed
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      color: Color(0xFF0E0F12),
    ),
    child: SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (int index) {
          final bool isSelected = currentIndex == index;
          return InkWell(
            onTap: () => _onItemTapped(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8),
              width:isSelected?109.w: null,
              decoration: isSelected
                  ? BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    items[index]['image']!,
                    height: 24,
                    width: 24,
                    color: isSelected ? AppColorsNew.darkBackground800 : AppColorsNew.secondaryColor300,
                  ),
                  if (isSelected) ...<Widget>[
                    const SizedBox(width: 6),
                    Text(
                      items[index]['label']!,
                      style: AppTextStylesNew.t1Regular.copyWith(color: AppColorsNew.darkBackground800)
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );
}
}