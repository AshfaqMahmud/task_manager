import 'package:task_manager/task/task_model.dart';

abstract class TaskEvent {}

class TaskAdded extends TaskEvent {
  final TaskModel task;
  TaskAdded(this.task);
}
