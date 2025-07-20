import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class CustomSvgPicture extends StatelessWidget {
  const CustomSvgPicture({
    super.key,
    required this.path,
    this.width,
    this.height,
  });
  final String path;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      colorFilter: context.read<ThemeController>().isDarkMode
          ? ColorFilter.mode(AppColors.primaryTextDarkColor, BlendMode.srcIn)
          : ColorFilter.mode(AppColors.primaryTextLightColor, BlendMode.srcIn),
    );
  }
}
