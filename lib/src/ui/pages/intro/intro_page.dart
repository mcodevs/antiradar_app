import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/common/constants/app_images.dart';
import 'package:flutter/material.dart';

import '../auth/login/login_page.dart';
import '../auth/register/register_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 130),
              const Text(
                "YO'LDA",
                style: TextStyle(
                  fontFamily: "Righteous",
                  fontSize: 42,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "XAFSIZ VA JARIMALARSIZ\n       HARAKATLANING",
                style: TextStyle(
                  fontFamily: "RaviPrakash",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Image(
                image: AssetImage(AppImages.carImages),
                height: 230,
              ),
              const SizedBox(height: 90),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxWidth <= 600 ? 50 : 55,
                    width: constraints.maxWidth <= 360 ? double.infinity : 360,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "SAFARNI BOSHLANG",
                        style: TextStyle(
                            color: AppColors.greenColor,
                            fontFamily: "Righteous",
                            fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxWidth <= 600 ? 50 : 55,
                    width: constraints.maxWidth <= 360 ? double.infinity : 360,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.purpleColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "R O' Y H A T D A N  O' T I SH",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Righteous",
                            fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
