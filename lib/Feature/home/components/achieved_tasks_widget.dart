import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class AchievedTasksWidget extends StatelessWidget {
  const AchievedTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TasksController, double>(
      selector: (context, conteroller) => conteroller.percent,
      builder: (context, value, child) {
        TasksController tasksController = context.read<TasksController>();
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorScheme.of(context).surface,
            borderRadius: BorderRadius.circular(16),
            border: context.read<ThemeController>().isDarkMode
                ? null
                : Border.all(color: AppColors.borderLightColor),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Achieved Tasks',
                    style: TextTheme.of(context).titleMedium,
                  ),
                  Text(
                    '${tasksController.completedTasks.length} Out of ${tasksController.tasks.length} Done',
                    style: TextTheme.of(context).titleSmall,
                  ),
                ],
              ),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Transform.rotate(
                    angle: -pi / 2,
                    child: CircularProgressIndicator(
                      value: tasksController.percent,
                      backgroundColor: AppColors.borderLightColor,
                      strokeWidth: 7,
                      strokeAlign: 2,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '%${(value * 100).toInt()}',
                      style: TextTheme.of(
                        context,
                      ).titleSmall!.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 7),
            ],
          ),
        );
      },
    );
  }
}
