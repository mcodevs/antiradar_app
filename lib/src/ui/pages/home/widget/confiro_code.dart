import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget{
  final double radius;
  final Widget child;
  final VoidCallback onPressed;
  final double  size;

  const ConfirmButton({
    Key?key,
    required this.radius,
    required this.child,
    required this.onPressed,
    required this.size,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenColor,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}