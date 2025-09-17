import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:funds_32bj_poc/app/core/network/client/api_client.dart';

import 'package:flutter/services.dart';


import 'app.dart';

void commonMain() async {
  WidgetsFlutterBinding.ensureInitialized(); // important for async before runApp

 DartPluginRegistrant.ensureInitialized();




  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(0XFF5A2D7E) ,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  // Single instance for api client
  Get.put<ApiClient>(ApiClient());



  runApp(const MyApp());
}