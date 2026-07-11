import 'package:task_manager/task/task_event.dart';
import 'package:task_manager/task/task_state.dart';

import 'task_model.dart';

class TaskBloc {
  TaskState _state;

  /// not _state = ... , because bloc shouln't decide the initial state
  /// this is known as Dependency Injection

  /// this is the subscribers to the state changes of Application
  /// the Function mainly points at rebuild()
  /// void rebuild(TaskState state) {
  /// ...modifyTheUI();
  /// }
  final List<void Function(TaskState)> _listeners = [];

  TaskBloc(this._state);

  /// not getState(), because in Dart bloc.state is like a property.
  TaskState get state => _state;

  void subscribe(void Function(TaskState) listener) {
    _listeners.add(listener);
  }

  void add(TaskEvent event) {
    _handle(event);
  }

  void _handle(TaskEvent event) {
    /// this function should be able to receive every event
    if (event is TaskAdded) {
      // no need to cast event to TaskAdded manually, 'is' automatically does that
      /// we captured the event
      /// now create new state
      // TaskState current = get TaskState;
      // TaskState newState = addevent(current, newTask);
      // emit(newState);
      final newTasks = List<TaskModel>.from(_state.tasks);
      newTasks.add(event.task);
      final newState = _state.copyWith(tasks: newTasks);
      _emit(newState);
    } else if (event is TaskDeleted) {
    } else if (event is TaskUpdated) {
    } else if (event is TaskSearchQueryChanged) {}
  }

  void _emit(TaskState newState) {
    /// this will not notify the UI, just updates the states
    /// here _state is mainly the current state of Application
    _state = newState;

    for (final listener in _listeners) {
      listener(_state);
    }

    /// notify the UI
  }
}
/// TaskBloc
/// curentState
/// callbacks -> emit(newState) -> notify() -> UI or Analytics