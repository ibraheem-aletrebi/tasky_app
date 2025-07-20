class TaskModel {
  final int id;
  final String taskName;
  final String? taskDescription;
  bool isDone;
  final bool isHighPriority;

  TaskModel({
    required this.id,
    required this.taskName,
    this.taskDescription,
    required this.isHighPriority,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'taskName': taskName,
      'taskDescription': taskDescription,
      'isHighPriority': isHighPriority,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromJson(json) {
    return TaskModel(
      id: json['id'],
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      isHighPriority: json['isHighPriority'],
      isDone: json['isDone'],
    );
  }
}
