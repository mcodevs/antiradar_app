import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/common/constants/app_images.dart';
import 'package:antiradar/src/common/constants/app_text_themes.dart';
import 'package:antiradar/src/common/utils/extensions/extensions.dart';
import 'package:antiradar/src/ui/widgets/main_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                const Text(
                  "YO'LDA",
                  style: AppTextThemes.introTitle,
                ),
                const Text(
                  "XAFSIZ VA JARIMALARSIZ\nHARAKATLANING",
                  textAlign: TextAlign.center,
                  style: AppTextThemes.introSubtitle,
                ),
                Expanded(
                  flex: 9,
                  child: Center(
                    child: Image(
                      image: AssetImage(AppImages.carImages),
                      height: 230,
                    ),
                  ),
                ),
                MainButton(
                  onPressed: () => context.go(AppRoutes.login),
                  text: "Safarni boshlash",
                  style: AppTextThemes.buttonDefault,
                ),
                const SizedBox(height: 24),
                MainButton(
                  onPressed: () => context.go(AppRoutes.register),
                  text: "Ro'yhatdan o'tish",
                  backgroundColor: AppColors.secondary,
                  style: AppTextThemes.buttonWithSpace,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
