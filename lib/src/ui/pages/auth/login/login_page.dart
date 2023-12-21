import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/common/constants/app_text_themes.dart';
import 'package:antiradar/src/common/utils/extensions/extensions.dart';
import 'package:antiradar/src/ui/widgets/header.dart';
import 'package:antiradar/src/ui/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../widgets/custom_pinput.dart';
import '../widgets/custom_calculate_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void onButtonPressed(String value) {
    if (value == "<") {
      pinController.delete();
    } else if (value == "x") {
      pinController.clear();
    } else {
      pinController.append(value, 5);
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            children: [
              59.verticalSpace,
              const Header(text: "Kirish"),
              18.verticalSpace,
              Image(
                width: 154.w,
                height: 162.h,
                image: const AssetImage("assets/images/loginImage.png"),
                fit: BoxFit.cover,
              ),
              21.verticalSpace,
              SizedBox(
                height: 40.h,
                child: TextField(
                  controller: phoneController,
                  style: TextStyle(fontSize: 12.sp),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    hintText: "Telefon raqamingizni kiriting",
                    hintStyle: TextStyle(fontSize: 12.sp),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
              6.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Kirish kodini kiriting",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
              6.verticalSpace,
              CustomPinPut(
                pinController: pinController,
                focusNode: focusNode,
              ),
              19.verticalSpace,
              CustomCalculateButton(
                onButtonPressed: (value) => onButtonPressed(value),
              ),
              31.verticalSpace,
              const Spacer(),
              MainButton(
                onPressed: () {},
                text: "Keyingi",
                backgroundColor: AppColors.onPrimary,
                style: AppTextThemes.buttonDefault.copyWith(
                  color: AppColors.white,
                ),
              ),
              17.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
