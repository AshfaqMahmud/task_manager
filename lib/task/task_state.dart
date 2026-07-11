import 'task_model.dart';

/// User -> TaskAdded -> TaskBloc -> TaskState -> UI Rebuild
enum TaskFilter { all, pending, completed }

enum SortOption { newest, oldest, priority, dueDate }

enum LoadingStatus { initial, loading, loaded, failure }

class TaskState {
  /// it is final cz state is immutable
  final List<TaskModel> tasks;
  // String searchQuery;
  // TaskFilter filter;
  // SortOption sort;
  // String? errorMessage;

  const TaskState({required this.tasks});
  TaskState copyWith({List<TaskModel>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  /// to determine the task state, we need:
  /// if there any tasks or not
  /// is there any search query passed, based on the query update the VALID task list
  /// apply filter / sorting
  /// just modify the particular TaskState field here. not the UI
}
