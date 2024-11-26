import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:quick_task/models/task_model.dart';

class ParseService {
  static Future<void> initialize() async {
    const String appId = 'DrAvuR96HBtrTI190UCdOhco83iHR1slmktxMT4G';
    const String clientKey = 'Il3L1rdOJiibjvxGRl7869J2gUzd8JPa0Ff9McT0';
    const String serverUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(appId, serverUrl, clientKey: clientKey, autoSendSessionId: true);
  }

  static Future<bool> signUp(String username, String password) async {
    final user = ParseUser(username, password, null);
    final response = await user.signUp();
    return response.success;
  }

  static Future<bool> logIn(String username, String password) async {
    final user = ParseUser(username, password, null);
    final response = await user.login();
    return response.success;
  }

  static Future<List<ParseObject>> fetchTasks() async {
    final query = QueryBuilder<ParseObject>(ParseObject('Tasks'));
    final response = await query.query();
    if (response.success && response.results != null) {
      return response.results as List<ParseObject>;
    }
    return [];
  }

  static Future<void> addTask(String title, DateTime dueDate) async {
    final task = ParseObject('Tasks')
      ..set('title', title)
      ..set('dueDate', dueDate)
      ..set('isCompleted', false);
    await task.save();
  }

  static Future<void> toggleTaskStatus(String objectId, bool isCompleted) async {
    final task = ParseObject('Tasks')
      ..objectId = objectId
      ..set('isCompleted', isCompleted);
    await task.save();
  }

  static Future<void> saveTask(Task task) async {
    final taskObject = ParseObject('Tasks')
      ..set('title', task.title)
      ..set('dueDate', task.dueDate.toIso8601String())
      ..set('isCompleted', task.isCompleted);
    await taskObject.save();
  }

  static Future<void> deleteTask(String objectId) async {
    final task = ParseObject('Tasks')..objectId = objectId;
    await task.delete();
  }
}
