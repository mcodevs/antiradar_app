import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/common/constants/app_text_themes.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    required this.onPressed,
    this.style = AppTextThemes.buttonDefault,
    this.backgroundColor = AppColors.white,
    this.child,
    this.text,
    super.key,
  }) : assert((child != null) ^ (text != null));

  final VoidCallback onPressed;
  final Widget? child;
  final String? text;
  final TextStyle style;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(40),
        maximumSize: const Size.fromHeight(53),
        fixedSize: const Size.fromHeight(53),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child ??
          Text(
            text!.toUpperCase(),
            style: style,
          ),
    );
  }
}
