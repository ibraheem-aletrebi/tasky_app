import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/add_task/components/form_add_task_widget.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';

import 'package:tasky/core/widgets/custom_elevated_button.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TasksController tasksController = context.read<TasksController>();
    return Scaffold(
      appBar: AppBar(title: Text('New Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: tasksController.formKey,
          child: Column(
            children: [
              FormAddTaskWidget(),
              CustomElevatedButton(
                onPressed: () {
                  if (tasksController.formKey.currentState!.validate()) {
                    tasksController.addTask();
                    context.pop(true);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [Icon(Icons.add), Text('Add Task')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
