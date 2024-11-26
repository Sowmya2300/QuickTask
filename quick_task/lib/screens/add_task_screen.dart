import 'package:flutter/material.dart';
import 'package:quick_task/models/task_model.dart';
import 'package:quick_task/services/parse_services.dart';

class TaskForm extends StatefulWidget {
  final Task? task;

  TaskForm({this.task});

  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  late String title;
  DateTime? dueDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task == null ? "Add Task" : "Edit Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.task?.title,
                decoration: InputDecoration(labelText: "Title"),
                onSaved: (value) => title = value!,
              ),
              TextButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: dueDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dueDate = pickedDate;
                    });
                  }
                },
                child: Text(
                  dueDate == null
                      ? "Pick Due Date"
                      : "Due Date: ${dueDate!.toLocal()}",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final newTask = Task(
                      title: title,
                      dueDate: dueDate ?? DateTime.now(),
                      isCompleted: widget.task?.isCompleted ?? false,
                    );
                    await ParseService.saveTask(newTask);
                    Navigator.pop(context, newTask);
                  }
                },
                child: Text("Save Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
