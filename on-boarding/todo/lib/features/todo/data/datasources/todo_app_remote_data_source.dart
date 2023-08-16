import '../../domain/entities/task.dart';
import '../models/tasks_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TasksModel>> viewAllTasks();
  Future<TasksModel> createTask(Tasks task);
  Future<TasksModel> viewTask(Tasks task);
}
