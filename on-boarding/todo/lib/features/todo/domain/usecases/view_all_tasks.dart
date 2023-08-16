import 'package:dartz/dartz.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

class ViewAllTasks implements UseCase<void, List<Task>> {
  final TodoRepository repository;

  ViewAllTasks(this.repository);

  @override
  Future<Either<Failure, List<Tasks>>> call(Null) async {
    return await repository.viewAllTasks();
  }
}
