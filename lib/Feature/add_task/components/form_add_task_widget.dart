import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';

class FormAddTaskWidget extends StatelessWidget {
  const FormAddTaskWidget({super.key});
  @override
  Widget build(BuildContext context) {
    TasksController tasksController = context.read<TasksController>();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              title: 'Task Name',
              hintTxt: 'Finish UI design for login screen',
              controller: tasksController.taskNameController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "This field is required..!";
                }
                return null;
              },
            ),
            SizedBox(height: 28),
            CustomTextFormField(
              title: 'Task Description',
              hintTxt: 'Finish onboarding UI and hand off to devs by Thursday.',
              controller: tasksController.taskDescriptionController,
              maxLines: 6,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('High Priority', style: TextTheme.of(context).titleMedium),
                Consumer<TasksController>(
                  builder: (context, controller, child) => Switch(
                    value: controller.isHighPrioriyt,
                    onChanged: (value) {
                      tasksController.togglePriority(value);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
