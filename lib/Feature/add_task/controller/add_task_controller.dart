import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';

class AddTaskController with ChangeNotifier {
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHighPrioriyt = true;

  togglePriority(bool value) {
    isHighPrioriyt = value;
    notifyListeners();
  }

  addTask() async {
    String? tasksJson = PreferenceManegar().getString(StorageKey.tasks);
    List<dynamic> tasksList = [];
    if (tasksJson != null) {
      tasksList = jsonDecode(tasksJson);
    }
    TaskModel task = TaskModel(
      id: tasksList.length + 1,
      taskName: taskNameController.text,
      taskDescription: taskDescriptionController.text,
      isHighPriority: isHighPrioriyt,
    );
    tasksList.add(task.toJson());
    String taskAfterEncode = jsonEncode(tasksList);
    await PreferenceManegar().setString(StorageKey.tasks, taskAfterEncode);
    notifyListeners();
  }
}
