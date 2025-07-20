import 'package:flutter/widgets.dart';
import 'package:tasky/Feature/home/components/task_item_widget.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/core/widgets/custom_no_task_widget.dart';

class ListTaskItemsWidget extends StatelessWidget {
  const ListTaskItemsWidget({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return tasks.isEmpty
        ? Expanded(child: CustomNoTaskWidget())
        : Expanded(
            child: ListView.separated(
              itemCount: tasks.length,
              separatorBuilder: (context, index) => SizedBox(height: 8),
              itemBuilder: (context, index) =>
                  TaskItemWidget(model: tasks[index]),
            ),
          );
  }
}
