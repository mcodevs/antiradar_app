import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.pinController,
    required this.focusNode,
  });

  static final defaultPinTheme = PinTheme(
    width: 40.w,
    height: 40.h,
    textStyle: TextStyle(
      fontSize: 20.sp,
      color: AppColors.black,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: AppColors.black),
    ),
  );

  final TextEditingController pinController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      controller: pinController,
      focusNode: focusNode,
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      useNativeKeyboard: false,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => 11.horizontalSpace,
      onCompleted: (pin) {},
      onChanged: (value) {},
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme,
      submittedPinTheme: defaultPinTheme,
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
