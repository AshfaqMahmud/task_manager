import 'package:flutter/material.dart';
import 'package:task_manager/features/task/model/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        task.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
      ),
      title: Text(task.title, style: TextStyle(fontWeight: FontWeight.w800)),
      subtitle: Text(task.priority.name.toUpperCase()),
    );
  }
}
