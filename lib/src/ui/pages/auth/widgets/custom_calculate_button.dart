import 'package:antiradar/src/ui/widgets/custom_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCalculateButton extends StatelessWidget {
  final void Function(String value) onButtonPressed;

  const CustomCalculateButton({
    super.key,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (i) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (j) {
              final index = i * 3 + j + 1;
              final value = switch (index) {
                <= 9 => '$index',
                == 10 => 'x',
                == 11 => '0',
                _ => '<',
              };
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 8.w),
                child: CustomFAB(
                  radius: 5,
                  onPressed: () => onButtonPressed(value),
                  size: 60.r,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
