import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/sign_in_view.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/onboarding_screen.dart';
import 'package:get/get.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';





final GlobalKey<NavigatorState> navigatorKey =
GlobalKey(debugLabel: "Main Navigator");

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  static CustomRouteObserver routeObserver = CustomRouteObserver();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context,Orientation orientation,DeviceType deviceType) {
  
   
       final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
       log("isDarkMode: $isDarkMode ");
        return GetMaterialApp(
          title: 'funds_32bj_poc-ai',
          // themeMode: ThemeMode.light,
          // theme:isDarkMode?Themes.darkTheme: Themes.lightTheme,
          defaultTransition: Transition.noTransition,
          transitionDuration: const Duration(),
          // initialRoute:
          // //isLoggedIn?Routes.HOME_SCREEN: 
          //    ,
         home: OnboardingScreen(),
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          navigatorObservers: <NavigatorObserver>[
            // routeObserver,
          ],
          // onGenerateRoute: RouteGenerator.generateRoute,
          // ),
        );
      }
    );
  }
}
