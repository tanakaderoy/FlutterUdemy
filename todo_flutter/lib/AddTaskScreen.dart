import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/controllers/TaskController.dart';
import 'package:todo_flutter/models/Task.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskController>(builder: (context, controller, child) {
      String task;

      return Container(
        color: Color.fromRGBO(117, 117, 117, 1),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(),
                onChanged: (val) {
                    task = val;
                },
                onEditingComplete: () {
                  controller.addToTaskList(Task(task: task));
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlueAccent,
                onPressed: () {
                  controller.addToTaskList(Task(task: task));
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
