import 'package:flutter/material.dart';
import 'package:quick_task/screens/auth_screen.dart';
import 'package:quick_task/services/parse_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ParseService.initialize();
  runApp(QuickTaskApp());
}

class QuickTaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickTask',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
    );
  }
}
