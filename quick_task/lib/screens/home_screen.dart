import 'package:flutter/material.dart';
import 'package:quick_task/models/task_model.dart';
import 'package:quick_task/services/parse_services.dart';
import 'package:quick_task/widgets/task_item.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final fetchedTasks = await ParseService.fetchTasks();
    setState(() {
      tasks = fetchedTasks.map((parseObject) => Task.fromParseObject(parseObject)).toList();
    });
  }

  void _openTaskForm() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskForm()),
    );
    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QuickTask")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(task: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openTaskForm,
        child: Icon(Icons.add),
      ),
    );
  }
}
