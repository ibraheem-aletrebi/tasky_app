import 'package:flutter/material.dart';

enum TaskItemActionsEnum {
  toggleDone(name: 'Done/UnDone', icon: Icons.done),
  edit(name: 'Edit', icon: Icons.edit),
  delete(name: 'Delete', icon: Icons.delete);

  final String name;
  final IconData icon;
  const TaskItemActionsEnum({required this.name, required this.icon});
}
