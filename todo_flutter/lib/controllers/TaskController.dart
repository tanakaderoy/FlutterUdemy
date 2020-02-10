import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_flutter/models/Task.dart';

class TaskController extends ChangeNotifier {
  List<Task> _taskList;

  UnmodifiableListView<Task> get taskList => UnmodifiableListView(_taskList);

  TaskController() {
    _taskList = [];
    for (int i = 0; i < 20; i++) {
      _taskList.add(Task(task: 'task $i', isChecked: false));
    }
  }

  void toggleChecked(int index) {
    _taskList[index].toggleCheckBox();
    notifyListeners();
  }

  List<Task> getTaskList() {
    return _taskList;
  }

  void addToTaskList(Task task) {
    _taskList.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _taskList.remove(task);
    notifyListeners();
  }

  int get taskCount {
    return _taskList.length;
  }
}
