import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/theme/theme_controller.dart';

class HighPriorityTaskItemWidget extends StatelessWidget {
  const HighPriorityTaskItemWidget({super.key, required this.model});
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    ThemeController themeController = context.read<ThemeController>();
    return Consumer<TasksController>(
      builder: (context, controller, child) => Row(
        children: [
          Checkbox(
            value: model.isDone,
            onChanged: (value) {
              controller.toggleDoneTask(model.id);
            },
          ),
          Text(
            model.taskName,
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
        ],
      ),
    );
  }
}
