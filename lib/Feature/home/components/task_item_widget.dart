import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/popup_menu_widget.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.model});
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read<ThemeController>();
    return Consumer<TasksController>(
      builder: (context, controller, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: ColorScheme.of(context).surface,
          borderRadius: BorderRadius.circular(16),
          border: themeController.isDarkMode
              ? null
              : Border.all(color: AppColors.borderLightColor),
        ),
        child: Row(
          children: [
            Checkbox(
              value: model.isDone,
              onChanged: (value) {
                controller.toggleDoneTask(model.id);
              },
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.taskName,
                  maxLines: 1,
                  style: TextTheme.of(context).titleMedium?.copyWith(
                    decorationColor: themeController.isDarkMode
                        ? Color(0xFFA0A0A0)
                        : Color(0xFF6A6A6A),
                    decoration: model.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 2,
                  ),
                ),
                if (!(model.taskDescription != null &&
                    model.taskDescription!.isEmpty))
                  Text(
                    model.taskDescription!,
                    maxLines: 1,
                    style: TextTheme.of(context).titleSmall?.copyWith(
                      decorationColor: themeController.isDarkMode
                          ? Color(0xFFA0A0A0)
                          : Color(0xFF6A6A6A),
                      decoration: model.isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 2,
                    ),
                  ),
              ],
            ),
            Spacer(),
            PopupMenuWidget(model: model),
          ],
        ),
      ),
    );
  }
}
