import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/layaout/controller/app_controller.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/styles/app_colors.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  Widget _buildSvgPicture({
    required String path,
    required int index,
    required int currentIndx,
  }) {
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(
        currentIndx == index
            ? AppColors.primaryColor
            : AppColors.secondaryTextDarkColor,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppController()..init(),

      child: Consumer<AppController>(
        builder: (context, value, child) => Scaffold(
          body: SafeArea(
            child: ChangeNotifierProvider<TasksController>(
              create: (_) => TasksController()..init(),
              child: value.body,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.currentIndex,
            onTap: (int? index) {
              value.change(index ?? 0);
            },
            items: [
              BottomNavigationBarItem(
                icon: _buildSvgPicture(
                  path: 'assets/icons/home_icon.svg',
                  index: 0,
                  currentIndx: value.currentIndex,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildSvgPicture(
                  path: 'assets/icons/uncomplete_task_icon.svg',
                  index: 1,
                  currentIndx: value.currentIndex,
                ),
                label: 'To Do',
              ),
              BottomNavigationBarItem(
                icon: _buildSvgPicture(
                  path: 'assets/icons/complete_task_icon.svg',
                  index: 2,
                  currentIndx: value.currentIndex,
                ),
                label: 'Complete',
              ),
              BottomNavigationBarItem(
                icon: _buildSvgPicture(
                  path: 'assets/icons/profile.svg',
                  index: 3,
                  currentIndx: value.currentIndex,
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
