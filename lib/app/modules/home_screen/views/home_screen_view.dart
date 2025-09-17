import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/widgets/header_widget.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import '../../../common/widgets/bottom_nav.dart';
import '../controllers/home_screen_controller.dart';


class HomeScreenView extends GetView<HomeScreenController> {
   HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColorsNew.darkBackground600,
      statusBarIconBrightness: Brightness.light,
    ),
  );
});

    return Scaffold(
      extendBody: true,
      backgroundColor: AppColorsNew.darkBackground600,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            // Sticky Header
           Padding(
                  padding: EdgeInsets.only(top: 17.w, left: 15.w, right: 15.w,  bottom: 16.w),
                  child:  CommonHeaderWidget(
                  title: "New User,",
                    showCalendarIcon: false,
                    showPatientIcon: false,
                    isFromHome: true,
                  ),
                ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: SizedBox()
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(
        currentIndex: 0,
      ),
    );
  }
}

// String _shortenName(String? name) {
//   if (name == null || name.isEmpty) {
//     return 'User';
//   }
//   return name.length <= 16 ? name.capitalizeFirst! : '${name.substring(0, 14)}...';
// }

