
import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/widgets/auth_nav_row.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/widgets/email_password_column.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/widgets/privacy_terms_with_emergency_column.dart';
import 'package:funds_32bj_poc/app/common/const/feature_const/auth_const.dart';
import 'package:funds_32bj_poc/app/common/widgets/primary_button.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';

import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/modules/home_screen/views/home_screen_view.dart';
import 'package:get/get.dart';



import 'widgets/face_detection_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _showPsdNotifier = ValueNotifier<bool>(true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 
  final ValueNotifier<bool> _isButtonEnabledNotifier =
      ValueNotifier<bool>(false);

  /// 👇 Added focus node
  final FocusNode _usernameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Automatically request focus when page loads
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _usernameFocusNode.requestFocus();
    // });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsNew.secondaryColor100,
      body: SafeArea(
        child: SingleChildScrollView(
        //  padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   Container(height: 16.w,color:Color(0XFFD1BEEB) ,),
                  // Logo and SignUp
                  AuthNavRow(
                    onTap: (){},
                    isFromSignIn: true,
                  ),
                  Stack(
                    children: [
                        Container(
                        height: 25.w,
                        decoration: BoxDecoration(
                          color: Color(0XFFD1BEEB) ,
                        
                        ),
                      ),
                      Container(
                        height: 53.w,
                        decoration: BoxDecoration(
                          color: AppColorsNew.secondaryColor100,
                          borderRadius: BorderRadius.circular(20)
                        ),
                      ),
                    ],
                  ),
                
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      AuthConst().signIn,
                      style: AppTextStylesNew.h3SemiBold.copyWith(color:Color(0XFF5A2D7E) )
                    ),
                  ),
                  const SizedBox(height: 20),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 30.w),
                 child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              EmailPasswordFieldColumn(
                                usernameController: _usernameController,
                                passwordController: _passwordController,
                                showPsdNotifier: _showPsdNotifier,
                                isPasswordEmptyValidation: true,
                                validationNotifier: _isButtonEnabledNotifier,
                 
                                /// 👇 pass the focus node to username field
                                usernameFocusNode: _usernameFocusNode,
                              ),
                              SizedBox(height: 14.h),
                              GestureDetector(
                                onTap: () {
                                 
                                },
                                child: Text(
                                  AuthConst().forgotPassword,
                                  style: AppTextStylesNew.t3Regular.copyWith(
                                    color:Color(0XFF2D68C7),
                                  ),
                                ),
                              ),
                              SizedBox(height: 25.h),
                            ValueListenableBuilder<bool>(
                                  valueListenable: _isButtonEnabledNotifier,
                                  builder: (BuildContext context, bool isEnabled,
                                      Widget? child) {
                                    return PrimaryButton(
                                      label: AuthConst().signIn,
                                      //isDisabled: !isEnabled,
                                      onTap: () {
                                        // if (_formKey.currentState!.validate()) {
                                        //   log("validate");
                                       Get.to(HomeScreenView());
                                     //   }
                                      },
                                    );
                                  },
                                )
                            ],
                          ),
               ),
                SizedBox(height: 15.w),

                            Center(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                                child: Text.rich(maxLines: 1,
                                               overflow: TextOverflow.ellipsis,
                                                    TextSpan(
                                                      children: <InlineSpan>[
                                                         TextSpan(text: "Don't have an account? ", style: AppTextStylesNew.t4Regular.copyWith(color:Color(0XFF525252) )),
                                                        TextSpan(text: "sign up", style: AppTextStylesNew.t4Regular.copyWith(color:Color(0XFF2D68C7) ),),
                                                    
                                                      ],
                                                    ),
                                                  ),
                              ),
                            ),
                         
                  SizedBox(height: 20.w),
                  Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: FaceDetectionWidget(),
                  ),
                  SizedBox(height: 45.w),
                  Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child:FooterLinks(),
                  ),
                  //const SizedBox(height: 30),
                ],
              )
          ),
        ),
      ),
    );
  }
}


class FooterLinks extends StatelessWidget {
  final VoidCallback? onAbout;
  final VoidCallback? onPrivacy;
  final VoidCallback? onTerms;

  const FooterLinks({
    Key? key,
    this.onAbout,
    this.onPrivacy,
    this.onTerms,
  }) : super(key: key);

  static const _linkColor = Color(0xFF565656);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12.0,
          children: [
            _linkButton('ABOUT US', onAbout),
            _verticalDivider(),
            _linkButton('PRIVACY POLICY', onPrivacy),
            _verticalDivider(),
            _linkButton('TERMS OF USE', onTerms),
          ],
        ),
      ),
    );
  }

  Widget _linkButton(String text, VoidCallback? onTap) {
    // Use InkWell for ripple effect if inside a Material widget.
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Text(
          text,
          style:AppTextStylesNew.t7Regular.copyWith(color: _linkColor),
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 1,
      height: 18,
      color: _linkColor,
      margin: const EdgeInsets.symmetric(horizontal: 6),
    );
  }
}
