import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/const/feature_const/auth_const.dart';

import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';


import '../../../../../../common/const/assets_const/icon_const.dart';

/// Renders a "–––  Or Sign in with  –––" separator, then the biometric button.
class FaceDetectionWidget extends StatelessWidget {
   const FaceDetectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
        return Column(
          children: [
            // Separator
      
        
                 Padding(
                  padding:   EdgeInsets.symmetric(vertical: 25.w),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.1,
                          color: AppColorsNew.tertiaryColor600,
                        ),
                      ),
                      Padding( 
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          'Or Sign in with',
                          style: AppTextStylesNew.t2Regular
                              .copyWith(color: Color(0XFF656565) ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.1,
                          color: Color(0XFF656565) ,
                        ),
                      ),
                    ],
                  ),
                ),
        SizedBox(height: 30.w),
            // Biometric button
   GestureDetector(
                    onTap: () async {
             
                    },
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SvgPicture.asset(
                            IconsConst.faceRecognitionIcon,
                            height: 35,
                            color: Color(0XFF5A2D7E) ,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            Platform.isAndroid
                                ? AuthConst().biometricDetectionLabel
                                : AuthConst().faceDetectionLabel,
                            style: AppTextStylesNew.t2Regular.copyWith(
                              color: Color(0XFF5A2D7E) ,
                            ),
                          ),
                        ],
                      ),
                    ),
              
            ),
          ],
        );
     
  }
}
