import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_new_colors.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/card_widgets.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/events_widgets.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/health.widget.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/home_widget.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/quick_action_widget.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/widgets/retirement_widget.dart';
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
      backgroundColor: AppNewColors.primaryColor100,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sticky Header
              Padding(
                padding: EdgeInsets.only(
                    top: 17.w, left: 15.w, right: 15.w, bottom: 16.w),
                child: CommonHeaderWidget(
                  userName: "Thomas George", // dynamic username if needed
                  greeting: "Good Morning,", // pass greeting text
                  onProfileTap: () {
                    // handle profile tap
                  },
                  onBellTap: () {
                    // handle bell tap
                  },
                ),
              ),

              // Content
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: const QuickActionWidget(),
              ),
              const SizedBox(height: 20),
              Column(
              children: [
                InfoCard(
                  bgColor: Color(0xff7a40a7),
                  icon: IconsConst.trainingIcon2,
                  title: "Training",
                  description: "Take your career to the next level by making the most of …",
                  onTap: () {
                    print("Training tapped");
                  },
                ),
                InfoCard(
                  bgColor: Color(0xfff3be54),
                  icon: IconsConst.legalIcon2,
                  title: "Legal",
                  description: "Our legal services fund provides legal advice and representation…",
                  onTap: () {
                    print("Legal tapped");
                  },
                ),
                RetirementCard(
                  balance: "\$12,854.63",
                  savings: "401(k)",
                  onViewDetails: () => print("View details tapped"),
                ),
                HealthCard(
                  planName: "Anthem Blue Cross – Family \nCoverage",
                  onViewIdCards: () => print("View ID tapped"),
                  onManageDependents: () => print("Manage dependents tapped"),
                  onSeeMore: () => print("See more tapped"),
                ),
              ],
            ),

              // const HomeWidget(),
              SizedBox(height: 20.w),
              UpcomingEventListExample(),
      
              SizedBox(height: 100,)

            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}
