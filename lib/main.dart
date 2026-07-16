import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/features/task/bloc/task_bloc.dart';
import 'package:task_manager/features/task/pages/calendar_page.dart';
import 'package:task_manager/features/task/pages/settings_page.dart';
import 'package:task_manager/features/task/pages/stats_page.dart';
import 'package:task_manager/features/task/pages/task_page.dart';

void main() {
  // final bloc = TaskBloc(TaskState(tasks: []));
  // bloc.subscribe((state) {
  //   print(state.tasks.length);
  // });
  // bloc.add(
  //   TaskAdded(
  //     TaskModel(
  //       id: '1',
  //       title: 'bloc learn',
  //       description: 'simple test',
  //       dueDate: DateTime(2026, 7, 20),
  //       createdAt: DateTime.now(),
  //     ),
  //   ),
  // );
  // bloc.add(
  //   TaskAdded(
  //     TaskModel(
  //       id: '4',
  //       title: 'bloc learn 2',
  //       description: 'simple test',
  //       dueDate: DateTime(2026, 7, 19),
  //       createdAt: DateTime.now(),
  //     ),
  //   ),
  // );

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      color: Colors.black,
      theme: ThemeData(
        useMaterial3: true,
        // 👇 This overrides the default Material 3 behavior globally
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.greenAccent, // Changes the text/icon color
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/tasks': (context) => const TaskPage(),
        '/calendar': (context) => const CalendarPage(),
        '/stats': (context) => const StatsPage(),
        '/settings': (context) => const SettingsPage(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  static const _titles = ['Tasks', 'Calendar', 'Stats', 'Settings'];
  static const _colors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.black,
        indicatorColor: Colors.green,
        indicatorShape: CircleBorder(),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.task_alt), label: 'Task'),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_sharp),
            label: 'Calendar',
          ),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Stats'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      appBar: AppBar(
        backgroundColor: _colors[currentPageIndex],
        title: Text(
          _titles[currentPageIndex],
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          TaskPage(),
          CalendarPage(),
          StatsPage(),
          SettingsPage(),
        ],
      ),
    );
  }
}
