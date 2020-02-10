
class Task {
  final String task;
  bool isChecked;

  Task({this.task, this.isChecked = false});

  void toggleCheckBox() {
    isChecked = !isChecked;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Task &&
              runtimeType == other.runtimeType &&
              task == other.task &&
              isChecked == other.isChecked;

  @override
  int get hashCode =>
      task.hashCode ^
      isChecked.hashCode;


}
