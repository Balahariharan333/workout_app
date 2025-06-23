
import 'package:flutter/foundation.dart';
import '../models/workout_task.dart';

class WorkoutTodoProvider extends ChangeNotifier {
  final List<WorkoutTask> _tasks = [];

  List<WorkoutTask> get tasks => _tasks;

  void addTask(String title) {
    if (title.trim().isEmpty) return;
    _tasks.add(WorkoutTask(title: title));
    notifyListeners();
  }

  void toggleDone(WorkoutTask task) {
    task.isDone = !task.isDone;
    notifyListeners();
  }

  void deleteTask(WorkoutTask task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
