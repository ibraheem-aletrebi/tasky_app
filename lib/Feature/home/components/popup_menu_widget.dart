import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/enums/task_item_actions_enum.dart';
import 'package:tasky/core/styles/app_colors.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/core/widgets/custom_elevated_button.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';

class PopupMenuWidget extends StatelessWidget {
  const PopupMenuWidget({super.key, required this.model});
  final TaskModel model;

  Future<void> _showModelBottomSheet(
    BuildContext context,
    TaskModel model,
  ) async {
    final controller = context.read<TasksController>();
    controller.taskNameController.text = model.taskName;
    controller.taskDescriptionController.text = model.taskDescription ?? '';
    controller.isHighPrioriyt = model.isHighPriority;
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.8,
          minChildSize: 0.7,
          maxChildSize: 0.9,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
              color: context.read<ThemeController>().isDarkMode
                  ? Color(0xFF181818)
                  : AppColors.secondaryLightColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: 80,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title: 'Task Name',
                            hintTxt: 'Finish UI design for login screen',
                            controller: controller.taskNameController,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "This field is required..!";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 28),
                          CustomTextFormField(
                            title: 'Task Description',
                            hintTxt:
                                'Finish onboarding UI and hand off to devs by Thursday.',
                            controller: controller.taskDescriptionController,
                            maxLines: 6,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'High Priority',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Selector<TasksController, bool>(
                                selector: (context, controller) =>
                                    controller.isHighPrioriyt,
                                builder: (context, value, child) {
                                  return Switch(
                                    value: value,
                                    onChanged: (newValue) {
                                      context
                                          .read<TasksController>()
                                          .togglePriority(newValue);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    child: Text('Save Changes'),
                    onPressed: () {
                      controller.updateTask(model.id);
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TaskItemActionsEnum>(
      onSelected: (value) {
        final controller = context.read<TasksController>();
        switch (value) {
          case TaskItemActionsEnum.toggleDone:
            controller.toggleDoneTask(model.id);
            break;
          case TaskItemActionsEnum.edit:
            _showModelBottomSheet(context, model);
            controller.init();
            break;
          case TaskItemActionsEnum.delete:
            showDialog(
              context: context,
              builder: (controller) {
                return AlertDialog(
                  title: Text(
                    'Delete Task',
                    style: TextTheme.of(context).titleMedium,
                  ),
                  content: Text(
                    'Are you sure you want delete this task.',
                    style: TextTheme.of(context).titleMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        'Cancle',
                        style: TextTheme.of(context).titleMedium,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<TasksController>().deleteTask(model.id);
                        context.pop();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.redAccent,
                      ),
                      child: Text('Delete'),
                    ),
                  ],
                );
              },
            );
            break;
        }
      },
      itemBuilder: (context) => TaskItemActionsEnum.values.map((e) {
        return PopupMenuItem<TaskItemActionsEnum>(
          value: e,
          child: Row(
            children: [
              Icon(e.icon),
              const SizedBox(width: 5),
              Text(e.name, style: TextTheme.of(context).titleMedium),
            ],
          ),
        );
      }).toList(),
      child: SvgPicture.asset('assets/icons/dots_vertical_icon.svg'),
    );
  }
}
