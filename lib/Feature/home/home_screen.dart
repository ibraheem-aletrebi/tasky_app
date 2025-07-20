import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/Feature/add_task/add_task_screen.dart';
import 'package:tasky/Feature/home/components/achieved_tasks_widget.dart';
import 'package:tasky/Feature/home/components/high_priority_tasks_widget.dart';
import 'package:tasky/Feature/home/components/home_appbar_widget.dart';
import 'package:tasky/Feature/home/components/motivation_text_widget.dart';
import 'package:tasky/Feature/home/components/sliver_list_item_widget.dart';
import 'package:tasky/Feature/tasks/controller/tasks_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksController>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HomeAppbarWidget(),
                      SizedBox(height: 16),
                      MotivationTextWidget(),
                      SizedBox(height: 16),
                      AchievedTasksWidget(),
                      SizedBox(height: 16),
                      HighPriorityTasksWidget(),
                      SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Tasks',
                          style: TextTheme.of(context).displaySmall,
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                SliverListItemWidget(),
              ],
            ),
          ),

          floatingActionButton: SizedBox(
            width: 170,
            height: 40,
            child: FloatingActionButton.extended(
              onPressed: () async {
                final bool? isBack = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()),
                );
                if (isBack != null && isBack && context.mounted) {
                  context.read<TasksController>().init();
                }
              },

              icon: Icon(Icons.add),
              label: Text('Add New Task'),
            ),
          ),
        ),
      ),
    );
  }
}
