import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:tasky/Feature/model/task_model.dart';
import 'package:tasky/core/services/preference_manegar/preference_manegar.dart';
import 'package:tasky/core/services/preference_manegar/storage_key.dart';

class TasksController with ChangeNotifier {
  List<TaskModel> tasks = [];
  List<TaskModel> todoTasks = [];
  List<TaskModel> completedTasks = [];
  List<TaskModel> highPriorityTasks = [];
  double percent = 0;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHighPrioriyt = true;
  late TaskModel taskWillUpdate;

  initUpdatedTask(TaskModel model) {
    taskWillUpdate = model;
    taskNameController.text = model.taskName;
    taskDescriptionController.text = model.taskDescription ?? '';
    notifyListeners();
  }

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
    taskNameController.clear();
    taskDescriptionController.clear();
    tasksList.add(task.toJson());
    String taskAfterEncode = jsonEncode(tasksList);
    await PreferenceManegar().setString(StorageKey.tasks, taskAfterEncode);
    notifyListeners();
  }

  updateTask(int id) {
    final taskIndex = tasks.indexWhere((e) => e.id == id);
    taskWillUpdate = tasks[taskIndex];

    tasks[taskIndex] = TaskModel(
      id: id,
      taskName: taskNameController.text,
      taskDescription: taskDescriptionController.text,
      isHighPriority: taskWillUpdate.isHighPriority,
      isDone: tasks[taskIndex].isDone,
    );
    taskNameController.clear();
    taskDescriptionController.clear();
    _restoreTasks();
    init();
    notifyListeners();
  }

  init() {
    _loadTasks();
    _calculatePercent();
  }

  _loadTasks() {
    final tasksBeforeDecode = PreferenceManegar().getString(StorageKey.tasks);
    if (tasksBeforeDecode != null) {
      final decoded = jsonDecode(tasksBeforeDecode);
      if (decoded is List) {
        tasks = decoded.map((e) => TaskModel.fromJson(e)).toList();
        _loadData();
      } else {
        tasks = [];
      }
    }
    notifyListeners();
  }

  _restoreTasks() {
    PreferenceManegar().setString(StorageKey.tasks, jsonEncode(tasks));
  }

  void _calculatePercent() {
    percent = (completedTasks.isEmpty)
        ? 0
        : completedTasks.length / tasks.length;
  }

  void _loadData() {
    _filterTodoTasks();
    _filterCompletedTasks();
    _filterHighPriorityTasks();
  }

  void _filterTodoTasks() {
    todoTasks = tasks.where((e) => !e.isDone).toList();
  }

  void _filterCompletedTasks() {
    completedTasks = tasks.where((e) => e.isDone).toList();
  }

  void _filterHighPriorityTasks() {
    highPriorityTasks = tasks
        .where((e) => e.isHighPriority)
        .toList()
        .reversed
        .toList();
  }

  toggleDoneTask(int id) {
    final taskIndex = tasks.indexWhere((e) => e.id == id);
    tasks[taskIndex].isDone = !tasks[taskIndex].isDone;
    _restoreTasks();
    init();
    _calculatePercent();
    notifyListeners();
  }

  deleteTask(int id) {
    tasks.removeWhere((e) => e.id == id);
    _restoreTasks();
    init();
    notifyListeners();
  }
}
