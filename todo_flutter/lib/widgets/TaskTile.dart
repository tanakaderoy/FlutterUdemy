import 'package:flutter/material.dart';
import 'package:todo_flutter/models/Task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function toggleCheckBoxCallback;
  final Function removeCallback;

  TaskTile({@required this.task, this.toggleCheckBoxCallback, this.removeCallback});

  @override
  Widget build(BuildContext context) {
    var isChecked = task.isChecked;
    return ListTile(
      onLongPress: removeCallback,
      title: Text(
        task.task,
        style: TextStyle(
            fontSize: 18,
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: toggleCheckBoxCallback,
        value: isChecked,
      ),
    );
  }
}
//(bool checkBoxState) {
//          setState(() {
//            isChecked = checkBoxState;
//          });
//        },
//      )

//class TaskCheckbox extends StatelessWidget {
//  final bool checkBoxState;
//  final Function toggleCheckBoxState;
//
//  TaskCheckbox(
//      {@required this.checkBoxState, @required this.toggleCheckBoxState});
//
//  @override
//  Widget build(BuildContext context) {
//    return Checkbox(
//      activeColor: Colors.lightBlueAccent,
//      onChanged: toggleCheckBoxState,
//      value: checkBoxState,
//    );
//  }
//}
