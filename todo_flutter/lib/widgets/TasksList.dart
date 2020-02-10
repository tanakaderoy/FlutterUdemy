import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/controllers/TaskController.dart';
import 'package:todo_flutter/widgets//TaskTile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(
      builder: (context, taskController, child) {
        var tasks = taskController.getTaskList();
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            var task = taskController.taskList[index];
            return TaskTile(
              removeCallback:()=> taskController.removeTask(task),
              task: tasks[index],
              toggleCheckBoxCallback: (checkBoxState) {
                taskController.toggleChecked(index);
              },
            );
          },
        );
      },
    );
  }
}
