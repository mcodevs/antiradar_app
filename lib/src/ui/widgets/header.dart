import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/common/constants/app_text_themes.dart';
import 'package:antiradar/src/common/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text.toUpperCase(),
          style: AppTextThemes.header,
        ),
        8.verticalSpace,
        ConstrainedBox(
          constraints: const BoxConstraints.expand(
            width: 218,
            height: 1,
          ),
          child: const ColoredBox(
            color: AppColors.secondary,
          ),
        ),
      ],
    );
  }
}
