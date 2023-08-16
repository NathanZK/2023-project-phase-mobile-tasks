import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';

import '../entities/task.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Tasks>>> viewAllTasks();
  Future<Either<Failure, void>> createTask(Tasks task);
  Future<Either<Failure, void>> viewTask(Tasks task);

}
