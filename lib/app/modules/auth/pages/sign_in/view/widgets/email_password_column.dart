import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/icon_const.dart';
import 'package:funds_32bj_poc/app/common/const/feature_const/auth_const.dart';
import 'package:funds_32bj_poc/app/common/widgets/custom_textfield.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/core/validators/auth_validators.dart';

class EmailPasswordFieldColumn extends StatelessWidget {
  const EmailPasswordFieldColumn({
    required ValueNotifier<bool> showPsdNotifier,
    required TextEditingController passwordController,
    required this.validationNotifier,
    TextEditingController? usernameController,
    FocusNode? usernameFocusNode, // 👈 added focus node
    super.key,
    this.confirmPasswordController,
    this.showConfirmPswd = false,
    this.isFromNewPswd = false,
    this.showConfirmPsdNotifier,
    this.isPasswordEmptyValidation = false,
  })  : _showPsdNotifier = showPsdNotifier,
        _passwordController = passwordController,
        _usernameController = usernameController,
        _usernameFocusNode = usernameFocusNode; // 👈 assign focus node

  final TextEditingController? _usernameController;
  final FocusNode? _usernameFocusNode; // 👈 added field
  final ValueNotifier<bool> _showPsdNotifier;
  final TextEditingController _passwordController;
  final bool isPasswordEmptyValidation;
  final ValueNotifier<bool> validationNotifier;
  final TextEditingController? confirmPasswordController;
  final bool showConfirmPswd;
  final ValueNotifier<bool>? showConfirmPsdNotifier;
  final bool isFromNewPswd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        isFromNewPswd
            ? const SizedBox()
            : CustomTextField(
                isFromAuth: true,
                prefixIconConstraints: BoxConstraints(minWidth: 15.w, minHeight: 15.w),
                prefix: SizedBox(
                  width: 15.w,
                  child: SvgPicture.asset(IconsConst.personIcon,width: 15.w,height: 15.w,)),
                  hintText: "Email address",
                  hintStyle: AppTextStylesNew.t4Light.copyWith(color: Color(0XFF939393)),
                //labelText: AuthConst().emailLabel,
                controller: _usernameController, // username controller
                focusNode: _usernameFocusNode,   // 👈 apply focus node here
                onChanged: (String val) {
                  notifyValidation();
                },
                validator: (String? value) => AuthValidator.email(value),
              ),
        isFromNewPswd ? const SizedBox() : const SizedBox(height: 20),
        ValueListenableBuilder<bool>(
          valueListenable: _showPsdNotifier,
          builder: (BuildContext context, bool showPsd, Widget? child) {
            return CustomTextField(
              isFromAuth: true,
               prefixIconConstraints: BoxConstraints(minWidth: 15.w, minHeight: 15.w),
                prefix: SizedBox(
              
                  child: SvgPicture.asset(IconsConst.padlockIcon,width: 18.w,height: 18.w,)),
                  hintText: "Password",
                  hintStyle: AppTextStylesNew.t4Light.copyWith(color: Color(0XFF939393)),
              // labelText: AuthConst().passwordLabel,
              controller: _passwordController,
              obscureText: showPsd, // toggle show/hide password
              textInputAction: TextInputAction.done,
              onChanged: (String val) {
                notifyValidation();
              },
              validator: (String? value) => isPasswordEmptyValidation
                  ? AuthValidator.empty(value, "password")
                  : AuthValidator.password(value),
                  suffixIconConstraints: BoxConstraints(minHeight: 18.w,minWidth: 18.w),
              suffix: Padding(
                padding: EdgeInsets.all(12.h),
                child: InkWell(
                  onTap: () =>
                      _showPsdNotifier.value = !(_showPsdNotifier.value),
                      
                  child: SvgPicture.asset(
                    showPsd
                        ? IconsConst.visibilityOffIcon
                        : IconsConst.visibilityIcon,
                    width: 18.w,
                    height: 18.w,color: Color(0XFF5A2D7E) ,
                    
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: !showConfirmPswd ? 0 : 20),
        showConfirmPswd &&
                confirmPasswordController != null &&
                showConfirmPsdNotifier != null
            ? ValueListenableBuilder<bool>(
                valueListenable: showConfirmPsdNotifier!,
                builder: (BuildContext context, bool showPsd, Widget? child) {
                  return CustomTextField(
                    isFromAuth: true,
                    labelText: AuthConst().confirmPasswordLabel,
                    controller: confirmPasswordController,
                    onChanged: (String val) {
                      notifyValidation();
                    },
                    obscureText: showPsd,
                    textInputAction: TextInputAction.done,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (AuthValidator.password(_passwordController.text) ==
                              null &&
                          value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    suffix: Padding(
                      padding: EdgeInsets.all(12.h),
                      child: InkWell(
                        onTap: () => showConfirmPsdNotifier!.value =
                            !(showConfirmPsdNotifier!.value),
                        child: SvgPicture.asset(
                          showPsd
                              ? IconsConst.visibilityOffIcon
                              : IconsConst.visibilityIcon,
                          width: 16.h,
                          height: 16.h,color: Color(0XFF5A2D7E),
                        ),
                      ),
                    ),
                  );
                },
              )
            : const SizedBox(),
      ],
    );
  }

  void notifyValidation() {
    if ((isFromNewPswd && _usernameController == null
            ? true
            : (_usernameController!.text.isNotEmpty &&
                AuthValidator.email(_usernameController.text) == null)) &&
        _passwordController.text.isNotEmpty &&
        (isPasswordEmptyValidation
            ? AuthValidator.empty(_passwordController.text, "password") == null
            : AuthValidator.password(_passwordController.text) == null) &&
        (confirmPasswordController == null
            ? true
            : confirmPasswordController!.text == _passwordController.text)) {
      validationNotifier.value = true;
    } else {
      validationNotifier.value = false;
    }
  }
}
