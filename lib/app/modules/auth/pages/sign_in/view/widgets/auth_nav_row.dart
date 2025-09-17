import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/common/const/feature_const/auth_const.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/widgets/logo_widget.dart';


class AuthNavRow extends StatelessWidget {
  const AuthNavRow({
    required this.onTap, super.key,  this.isFromSignIn=false,
  });

final void Function()? onTap;
final bool isFromSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const LogoWidget(),
        // Padding(
        //   padding: const EdgeInsets.only(top: 4),
        //   child: GestureDetector(
        //     onTap:onTap ,
        //     child: Text( isFromSignIn?AuthConst().signUp:AuthConst().signIn,
        //         style: AppTextStylesNew.t2Medium.copyWith(color: AppColorsNew.primaryColor500)),
        //   ),
        // ),
      ],
    );
  }
}
