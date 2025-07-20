import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/list_task_items_widget.dart';

import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/widgets/custom_screen_title.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TasksController, List<TaskModel>>(
      builder: (context, completedTask, child) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomScreenTitle(title: 'Completed Tasks'),
            SizedBox(height: 18),
            ListTaskItemsWidget(tasks: completedTask),
          ],
        ),
      ),
      selector: (context, controller) => controller.completedTasks,
    );
  }
}
