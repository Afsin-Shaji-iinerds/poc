import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';

import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';

import '../../core/theme/app_text_styles.dart';

enum FieldType {
  name,
  address,
  insuranceCarrier,
  insuranceNumber,
  any,
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.labelText,
    this.controller,
    this.focusNode,
    this.obscureText = false,
    this.readOnly = false,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.cursorHeight,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixIconConstraints,
    this.suffix,
    this.suffixIcon,
    this.inputFormatter,
    this.fieldType = FieldType.any,
    this.fillColor,
    this.enabled = true,
    this.isTextCapitalization = false,
    this.errorStyle,
    this.validator,
    this.asterisk = false,
    this.autofocus = false,
    this.isFromAuth=false,
    this.borderColor, this.suffixIconConstraints,
  });

  final String? labelText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final double? cursorHeight;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final Widget? prefix;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffix;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final FieldType fieldType;
  final Color? fillColor;
  final bool enabled;
  final bool isTextCapitalization;
  final TextStyle? errorStyle;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final bool asterisk;
  final bool autofocus;
  final bool isFromAuth;
  final Color? borderColor;

  
  @override
  Widget build(BuildContext context) {
    final FocusNode effectiveFocusNode = focusNode ?? FocusNode();

    return FormField<String>(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: controller?.text,
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (labelText != null) ...<Widget>[
              Text(
                labelText! + (asterisk ? ' *' : ''),
                style: isFromAuth
                    ? AppTextStylesNew.t2Regular
                        .copyWith(color: AppColorsNew.darkBackground800)
                    : AppTextStylesNew.t3Regular
                        .copyWith(color: AppColorsNew.darkBackground800),
              ),
              SizedBox(height: 8.h),
            ],

            // TextField container
            Container(
              decoration: BoxDecoration(
                color: fillColor ?? AppColorsNew.secondaryColor100,
                border: Border.all(
                  color: field.hasError
                      ? AppColorsNew.alertHighColor
                      : borderColor ?? const Color(0xFFD9D9D9),
                  width: 0.50.w,
                ),
                borderRadius: BorderRadius.circular(5.h),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.h),
              child: TextField(
                controller: controller,
                focusNode: effectiveFocusNode,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: obscureText,
                readOnly: readOnly,
                onTap: onTap,
                textInputAction: textInputAction,
                keyboardType: textInputType,
                maxLines: maxLines ?? 1,
                minLines: minLines??1,
                maxLength: maxLength,
                cursorHeight: cursorHeight,
                autofocus: autofocus,
                enabled: enabled,
                textCapitalization: isTextCapitalization
                    ? TextCapitalization.sentences
                    : TextCapitalization.none,
                style: AppTextStylesNew.t2Regular.copyWith(color: AppColorsNew.darkBackground800),

                // ✅ Fix: handle Next/Done properly
                onEditingComplete: () {
                  if (textInputAction == TextInputAction.next) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).unfocus();
                  }
                },

                onChanged: (String value) {
                  field.didChange(value);
                  if (onChanged != null) onChanged!(value);
                },
                inputFormatters: <TextInputFormatter>[
                  ...?inputFormatter,
                  FilteringTextInputFormatter.allow(
                    RegExp(patternMap[fieldType] ?? '.*'),
                  ),
                ],
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText ?? '',
                  hintStyle:hintStyle ?? AppTextStyles.bodySmall,
                  counterText: '',
                  prefixIcon: prefix,
                  prefixIconConstraints: prefixIconConstraints,
                  suffixIconConstraints: suffixIconConstraints,
                  suffixIcon: suffix ,//??
                      // (obscureText
                      //     ? Padding(
                      //         padding: EdgeInsets.all(12.h),
                      //         child: SvgPicture.asset(
                      //           IconsConst.visibilityIcon,
                      //           width: 16.h,
                      //           height: 16.h,color: Color(0XFF5A2D7E),
                      //         ),
                      //       )
                      //     : null)
                        //  ,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                ),
              ),
            ),

            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 12.h),
                child: Text(
                  field.errorText!,
                  style: errorStyle ?? const TextStyle(color: AppColorsNew.alertHighColor),
                ),
              ),
          ],
        );
      },
    );
  }
}
final Map<FieldType, String> patternMap = <FieldType, String>{
    FieldType.name: r"[a-zA-Z0-9 .,\-&']",
    FieldType.address: r"[a-zA-Z0-9 .,\-\'#/\\:]",
    FieldType.insuranceCarrier: r"[a-zA-Z0-9 .,\-\'&]",
    FieldType.insuranceNumber: r"[a-zA-Z0-9\-/#]",
    FieldType.any: r".", // NEW: Allows everything
  };