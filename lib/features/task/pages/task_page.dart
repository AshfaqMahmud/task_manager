import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/features/task/bloc/task_bloc.dart';
import 'package:task_manager/features/task/bloc/task_event.dart';
import 'package:task_manager/features/task/bloc/task_state.dart';
import 'package:task_manager/features/task/model/task_model.dart';
import 'package:task_manager/features/task/widgets/task_tile.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state.tasks.isEmpty) {
            return const Center(child: Text('No tasks'));
          }

          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return TaskTile(task: state.tasks[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final task = TaskModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: 'Task ${DateTime.now().second}',
            createdAt: DateTime.now(),
            dueDate: DateTime.now().add(Duration(days: 7)),
            priority: Priority.high,
          );

          context.read<TaskBloc>.add(TaskAdded(task));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
