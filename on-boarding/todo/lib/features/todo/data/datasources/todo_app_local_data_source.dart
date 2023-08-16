import 'package:todo/features/todo/data/models/tasks_model.dart';

abstract class TodoLocalDataSource {
  Future<void> cacheTodoList(List<TasksModel> todoListToCache);
  Future<List<TasksModel>> getAllTasks();
}
