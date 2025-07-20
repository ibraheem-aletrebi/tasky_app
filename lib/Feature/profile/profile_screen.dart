import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/circler_user_image_widget.dart';
import 'package:tasky/Feature/layaout/controller/app_controller.dart';
import 'package:tasky/Feature/profile/user_details_screen.dart';
import 'package:tasky/Feature/welcome/welcome_screen.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/core/widgets/custom_screen_title.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read<ThemeController>();
    AppController appController = context.read<AppController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomScreenTitle(title: 'My Profile'),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CirclerUserImageWidget(width: 140, height: 140),
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: ColorScheme.of(context).surface,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        contentPadding: EdgeInsets.all(16),
                        title: Text('Choose an Image'),
                        children: [
                          SimpleDialogOption(
                            onPressed: () {
                              appController.pickImageFromCamera();
                              context.pop();
                            },
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(Icons.camera_alt_rounded),
                                Text(
                                  'Take Picture',
                                  style: TextTheme.of(context).titleMedium,
                                ),
                              ],
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              appController.pickImageFromGallery();
                              context.pop();
                            },
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(Icons.photo_size_select_actual_rounded),
                                Text(
                                  'From Gallery',
                                  style: TextTheme.of(context).titleMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          SizedBox(height: 8),
          Selector<AppController, ({String userName, String motivationQuote})>(
            builder: (BuildContext context, data, Widget? child) => Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  data.userName,
                  maxLines: 1,
                  style: TextTheme.of(context).titleMedium,
                ),
                Text(
                  data.motivationQuote,
                  maxLines: 2,
                  style: TextTheme.of(context).titleSmall,
                ),
              ],
            ),
            selector: (context, appController) {
              return (
                userName: appController.userName,
                motivationQuote: appController.motivationQoute,
              );
            },
          ),

          SizedBox(height: 16),

          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Profile Info',
              style: TextTheme.of(context).titleMedium,
            ),
          ),

          GestureDetector(
            onTap: () async {
              final bool? isBack = await context.pushNamed(
                AppRoutes.kUserDetailsScreen,
              );
              if (isBack != null && isBack && context.mounted) {
                context.read<AppController>().init();
              }
            },
            child: ListTile(
              leading: CustomSvgPicture(path: 'assets/icons/profile_icon.svg'),
              title: Text('User Details'),
              trailing: CustomSvgPicture(path: 'assets/icons/arrow_icon.svg'),
            ),
          ),
          Divider(),
          Selector<ThemeController, bool>(
            selector: (context, controller) => controller.isDarkMode,
            builder: (context, value, child) => ListTile(
              leading: CustomSvgPicture(path: 'assets/icons/mode_icon.svg'),
              title: Text('Dark Mode'),
              trailing: Switch(
                value: value,
                onChanged: (value) {
                  themeController.toggelTheme();
                },
              ),
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () {
              appController.logout();
              context.pushReplacementNamed(AppRoutes.kWelcomScreen);
            },
            child: ListTile(
              leading: CustomSvgPicture(path: 'assets/icons/logout_icon.svg'),
              title: Text('Log Out'),
              trailing: CustomSvgPicture(path: 'assets/icons/arrow_icon.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
