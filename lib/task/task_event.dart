import 'package:task_manager/task/task_model.dart';

abstract class TaskEvent {}

class TaskAdded extends TaskEvent {
  /// this class need the whole task id
  final TaskModel task; // newly added task

  TaskAdded(this.task);
}

class TaskUpdated extends TaskEvent {
  /// this class need the task id and the task field/s to be modified
}

class TaskDeleted extends TaskEvent {
  /// this class doesn't need the whole task model but just the task id
}

class TaskSearchQueryChanged extends TaskEvent {}
