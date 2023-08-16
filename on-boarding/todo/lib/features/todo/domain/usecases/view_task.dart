import 'package:dartz/dartz.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

class ViewTask implements UseCase<void, Tasks> {
  final TodoRepository repository;

  ViewTask(this.repository);

  @override
  Future<Either<Failure, void>> call(Tasks task) async {
    return await repository.viewTask(task);
  }
}


