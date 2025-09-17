import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/core/theme/theme.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

class PrimaryButton extends StatelessWidget {

  const PrimaryButton({
    required this.label, required this.onTap, super.key,
    this.isDisabled = false,
    this.isLoading = false,
  this.buttonTextStyle,


  });
  final String label;
  final VoidCallback onTap;
  final bool isDisabled;
  final bool isLoading;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: isDisabled ? null : onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Opacity(
        opacity: isDisabled ? 0.2 : 1.0,
        child: Container(
          width: double.infinity,
          height: 56.h,
          decoration: BoxDecoration(
            color: Color(0XFF5A2D7E),
            // gradient: const LinearGradient(
            //   begin: Alignment(0.01, 0.11),
            //   end: Alignment(1.03, 1.00),
            //   colors: <Color>[
            //     Color(0xFF604B9A),
            //     Color(0xFF7962D4),
            //   ],
            // ),
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child:
          // isLoading?HelperWidgets.buildCircularProgressBar():
          Text(
            label,
            style:buttonTextStyle ?? AppTextStyles.primaryButtonStyle
          ),
        ),
      ),
    );
  }
}
