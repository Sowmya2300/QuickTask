import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Task {
  String title;
  DateTime dueDate;
  bool isCompleted;

  Task({
    required this.title,
    required this.dueDate,
    required this.isCompleted,
  });

  // Convert from Back4App object
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      dueDate: DateTime.parse(map['dueDate']),
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  // Convert to a Back4App object
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Task.fromParseObject(ParseObject parseObject) {
    return Task(
      title: parseObject.get<String>('title') ?? '',
      dueDate: DateTime.parse(parseObject.get<String>('dueDate') ?? ''),
      isCompleted: parseObject.get<bool>('isCompleted') ?? false,
    );
  }
}
