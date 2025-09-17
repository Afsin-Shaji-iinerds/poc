import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles.dart';

class HelperWidgets {
  static void buildStatusSnackBar({
    required String title,
    required bool isSuccess, String message='',
    Color? snackBgColor,
    bool displayMessage=true,
    void Function(GetSnackBar)? onTap,
    Duration animationDuration = const Duration(seconds: 1),
    }) {
    return WidgetsBinding.instance.addPostFrameCallback((_) {
       Get.showSnackbar(GetSnackBar(
       // snackPosition: SnackPosition.BOTTOM,
          // 2) Margin + padding to mimic your designs
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        
        // 3) Rounded corners
        borderRadius: 12,
     //     icon: ,
        animationDuration:animationDuration ,
        onTap:onTap ,
       // title: title,
        titleText: SizedBox(
          child: Row(
            children: <Widget>[
              isSuccess ? SvgPicture.asset(IconsConst.successIcon,height: !displayMessage? 18:24,width: !displayMessage? 18:24,fit: BoxFit.scaleDown,) :
                 SvgPicture.asset(IconsConst.failureIcon,height:!displayMessage? 18:24,width: !displayMessage? 18:24,),
              const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,style:AppTextStyles.bodyMedium500.copyWith(color: AppColorsNew.secondaryColor200) ,),
                      !displayMessage?const SizedBox():
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(!displayMessage?'‎': message.isEmpty ? isSuccess
                      ? 'Done! Your action was successful.'
                      : 'Oops! Something didn’t work. Please try again.' : message,style:AppTextStyles.bodySmall.copyWith(color: AppColorsNew.secondaryColor200,overflow:TextOverflow.ellipsis, ) ,maxLines: 3,),
                    ) ,

                  ],
                ),
              ),
            ],
          ),
        ),
            messageText:const SizedBox()
          ,
        backgroundColor: snackBgColor ??
          const Color(0xFF121C16),
        duration: const Duration(seconds: 2),
      ),
      );
    });
  }
 static Widget buildCircularProgressBar({Color? color}) {
    return Center(child: CircularProgressIndicator(color: color,),);
  }
}