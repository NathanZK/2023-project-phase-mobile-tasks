import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';

import '../entities/task.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Tasks>>> getAllTasks();
  Future<Either<Failure, void>> addTask(Tasks task, TodoRepository repository);
  Future<Either<Failure, void>> updateTask(Tasks task);
}
