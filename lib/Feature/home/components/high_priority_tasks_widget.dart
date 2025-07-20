import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/high_priority_task_item_widget.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class HighPriorityTasksWidget extends StatelessWidget {
  const HighPriorityTasksWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, tasksController, child) {
        final tasksList = tasksController.highPriorityTasks;
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: context.read<ThemeController>().isDarkMode
                ? null
                : Border.all(color: AppColors.borderLightColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'High Priority Tasks',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tasksList.length >= 4 ? 4 : tasksList.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      itemBuilder: (context, index) =>
                          HighPriorityTaskItemWidget(model: tasksList[index]),
                    ),
                  ],
                ),
              ),
              IconButton.filled(
                onPressed: () async {
                  await context.pushNamed(AppRoutes.kHighPriorityTasksScreen);
                  tasksController.init();
                },
                style: IconButton.styleFrom(
                  backgroundColor: context.read<ThemeController>().isDarkMode
                      ? AppColors.secondaryDarkColor
                      : AppColors.secondaryLightColor,
                  side: BorderSide(color: AppColors.borderLightColor),
                  minimumSize: const Size(48, 48),
                ),
                icon: SvgPicture.asset('assets/icons/arrow_up_right_icon.svg'),
              ),
            ],
          ),
        );
      },
    );
  }
}
