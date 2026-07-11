//import 'package:flutter/material.dart';
import 'package:task_manager/task/task_bloc.dart';
import 'package:task_manager/task/task_event.dart';
import 'package:task_manager/task/task_model.dart';
import 'package:task_manager/task/task_state.dart';

void main() {
  final bloc = TaskBloc(TaskState(tasks: []));
  bloc.subscribe((state) {
    print(state.tasks.length);
  });
  bloc.add(
    TaskAdded(
      TaskModel(
        id: '1',
        title: 'bloc learn',
        description: 'simple test',
        dueDate: DateTime(2026, 7, 20),
        createdAt: DateTime.now(),
      ),
    ),
  );
  bloc.add(
    TaskAdded(
      TaskModel(
        id: '4',
        title: 'bloc learn 2',
        description: 'simple test',
        dueDate: DateTime(2026, 7, 19),
        createdAt: DateTime.now(),
      ),
    ),
  );

  //runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
