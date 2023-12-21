import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final double? radius;
  final Widget child;
  final VoidCallback onPressed;
  final double size;
  final Color color;
  final EdgeInsets padding;

  const CustomFAB({
    Key? key,
    this.radius,
    required this.child,
    required this.onPressed,
    required this.size,
    this.color = AppColors.onPrimary,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8,
          padding: padding,
          backgroundColor: color,
          shape: radius != null
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(radius!)),
                )
              : const CircleBorder(),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
