import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/user_information_widget.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read<ThemeController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserInformationWidget(),
        IconButton.filled(
          onPressed: () {
            themeController.toggelTheme();
          },
          style: IconButton.styleFrom(
            backgroundColor: themeController.isDarkMode
                ? AppColors.secondaryDarkColor
                : AppColors.secondaryLightColor,
            side: themeController.isDarkMode
                ? BorderSide.none
                : BorderSide(color: AppColors.borderLightColor),
            minimumSize: Size(48, 48),
          ),
          icon: SvgPicture.asset(
            (themeController.isDarkMode)
                ? 'assets/icons/dark_icon.svg'
                : 'assets/icons/light_icon.svg',
          ),
        ),
      ],
    );
  }
}
