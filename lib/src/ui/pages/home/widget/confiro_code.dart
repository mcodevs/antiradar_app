import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final double? radius;
  final Widget child;
  final VoidCallback onPressed;
  final double size;
  final Color color;

  const ConfirmButton({
    Key? key,
    this.radius,
    required this.child,
    required this.onPressed,
    required this.size,
    this.color = AppColors.greenColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
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
