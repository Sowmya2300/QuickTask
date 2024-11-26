import 'package:flutter/material.dart';
import 'package:quick_task/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Due Date: ${task.dueDate.toLocal()}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        trailing: Icon(
          task.isCompleted ? Icons.check_circle : Icons.circle,
          color: task.isCompleted ? Colors.green : Colors.grey,
        ),
        onTap: () {
          // Handle task item tap
          // You can add additional actions, such as navigating to task details or toggling completion
        },
      ),
    );
  }
}
