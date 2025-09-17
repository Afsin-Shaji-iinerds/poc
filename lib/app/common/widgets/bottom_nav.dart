import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/modules/chat/views/chat_view.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/home_screen_view.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    required this.currentIndex,
    super.key,
  });

  final int currentIndex;

  void _onItemTapped(int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Get.off(() =>  HomeScreenView());
        break;
      case 3:
        Get.off(() => const ChatView());
        break;
      // TODO: Add other screens when ready
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = <Map<String, String>>[
      <String, String>{'image': IconsConst.homeIcon1, 'label': 'Home'},
      <String, String>{'image': IconsConst.benefitsIcon1, 'label': 'Benefits'},
      <String, String>{'image': IconsConst.trainingIcon1, 'label': 'Training'},
      <String, String>{'image': IconsConst.chatIcon1, 'label': 'Chat'},
      <String, String>{'image': IconsConst.moreIcon1, 'label': 'More'},
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (int index) {
              final bool isSelected = currentIndex == index;

              return InkWell(
                onTap: () => _onItemTapped(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0XFFD1BEEC) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        items[index]['image']!,
                        height: 25,
                        width: 25,
                        color: isSelected ? Color(0XFF5A2D7E) : Color(0XFF5C5C5C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index]['label']!,
                      style: AppTextStylesNew.t3Medium.copyWith(
                        color: isSelected ? const Color(0XFF5A2D7E) : Color(0XFF5C5C5C),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
