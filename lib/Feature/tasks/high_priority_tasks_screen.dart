import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/list_task_items_widget.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/widgets/custom_no_task_widget.dart';

class HighPriorityTasksScreen extends StatelessWidget {
  const HighPriorityTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TasksController>(
      create: (context) => TasksController()..init(),
      child: Consumer<TasksController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(title: Text('High Priority Tasks')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 18),
                controller.highPriorityTasks.isEmpty
                    ? Expanded(child: CustomNoTaskWidget())
                    : ListTaskItemsWidget(tasks: controller.highPriorityTasks),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
