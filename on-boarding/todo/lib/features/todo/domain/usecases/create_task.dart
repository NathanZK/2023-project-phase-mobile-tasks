import 'package:dartz/dartz.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';

class CreateTask implements UseCase<void, Tasks> {
  final TodoRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, void>> call(Tasks task) async {
    return await repository.createTask(task);
  }
}
