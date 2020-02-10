import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/controllers/TaskController.dart';
import 'package:todo_flutter/screens/TasksScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskController>(
      create: (context) => TaskController(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
