import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/task/task_event.dart';
import 'package:task_manager/task/task_model.dart';
import 'package:task_manager/task/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState.initial()) {
    on<TaskAdded>(_onTaskAdded);
  } // the parent class (Bloc) stores the state

  void _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
    final newTasks = List<TaskModel>.from(state.tasks);

    newTasks.add(event.task);

    emit(state.copyWith(tasks: newTasks));
  }

  // FutureOr<void> _onTaskAdded(TaskAdded event, Emitter<TaskState> emit) {
  //   final newTasks = List<TaskModel>.from(state.tasks);

  //   newTasks.add(event.task);
  //   emit(state.copyWith(tasks: newTasks));
  // }
}
