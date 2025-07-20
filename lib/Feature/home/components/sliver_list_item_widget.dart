import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/home/components/task_item_widget.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';
import 'package:tasky/core/widgets/custom_no_task_widget.dart';

class SliverListItemWidget extends StatelessWidget {
  const SliverListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<TasksController, List<TaskModel>>(
      selector: (_, controller) => controller.tasks,
      builder: (context, taskList, _) {
        if (taskList.isEmpty) {
          return SliverToBoxAdapter(child: CustomNoTaskWidget(width: 180));
        }
        return SliverPadding(
          padding: const EdgeInsets.only(bottom: 60),
          sliver: SliverList.separated(
            itemBuilder: (context, indx) =>
                TaskItemWidget(model: taskList[indx]),
            separatorBuilder: (context, indx) => const SizedBox(height: 8),
            itemCount: taskList.length,
          ),
        );
      },
    );
  }
}
