import 'package:dartz/dartz.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

abstract class UpdateTask {
  final TodoRepository repository;

  UpdateTask(this.repository);

  Future<Either<Failure, void>> execute({
    required Tasks task,
  });
}
