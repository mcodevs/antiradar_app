import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ConfiroButton extends StatelessWidget{
  final double radius;
  final Widget child;
  final VoidCallback onPressed;
  final double size;

  const ConfiroButton({
    Key?key,
    required this.radius,
    required this.child,
    required this.onPressed,
    required this.size,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}