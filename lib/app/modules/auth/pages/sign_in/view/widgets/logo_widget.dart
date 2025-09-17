import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/image_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return 
   Expanded(
     child: Container(
      color: Color(0XFFD1BEEB),
       child: Stack(
         children: [
          Image.asset(Images.siginImage,
          //width: 450.w,
               // height: 205.w,
          ),
           Positioned(
            left: 30.w,top: 50.w,
             child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    'Hello!',
                                    style: AppTextStylesNew.hBold.copyWith(color:Color(0XFF5A2D7E) ),
                                  ),
                                  SizedBox(height: 8.8.w),
                                  Text.rich(maxLines: 1,
                   overflow: TextOverflow.ellipsis,
                        TextSpan(
                          children: <InlineSpan>[
                             TextSpan(text: 'Welcome to ', style: AppTextStylesNew.h1Regular.copyWith(color:Color(0XFF5A2D7E) )),
                            TextSpan(text: "32BJ", style: AppTextStylesNew.h1Bold.copyWith(color:Color(0XFF5A2D7E) ),),
                        
                          ],
                        ),
                      ),
                             
                                ],
                              ),
           ),
         ],
       ),
     ),
   );
  }
}