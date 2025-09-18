import 'package:flutter/material.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/image_const.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/modules/auth/pages/sign_in/view/sign_in_view.dart';
import 'package:get/get.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  // Change this to your image asset path
  static const String illustrationAsset =Images.splashImage;

  @override
  Widget build(BuildContext context) {
    final purple = const Color(0xFF5A2D7E);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),

              // Title
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    height: 1.0,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.center,
                child: Text(
                  '32BJ SEIU',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                    color: purple,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Subtitle
              Text(
                'Together, we fight for quality healthcare,\nprotections at work and other benefits',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 0),

              // Illustration area - make big and responsive
              Expanded(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 1.1,
                    heightFactor: 0.7,
                    child: Image.asset(
                      illustrationAsset,
                      fit: BoxFit.contain,
                      // If you prefer to use a network image while testing:
                      // Image.network('https://...'),
                    ),
                  ),
                ),
              ),

               SizedBox(height: 15.w),

              // Pager dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  final bool active = index == 0; // middle dot active
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: active ? 12 : 10,
                    height: active ? 12 : 10,
                    decoration: BoxDecoration(
                      color: active ? Colors.amber[600] : Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 18),

              // Small description text
              Text(
                '32BJ is 185,000 working men and women just like you joined together for dignity and respect on the job.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),

               SizedBox(height: 45.w),

              // Buttons (Sign In and Sign Up)
              Row(
                children: [
                  // Sign In (outlined / light)
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(SignInView());
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade300),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                        ),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Sign Up (filled purple)
                  Expanded(
                    child: SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                        Get.to(SignInView());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purple,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                         // elevation: 3,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}
