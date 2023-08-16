import 'package:dartz/dartz.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

class GetAllTasks {
  final TodoRepository repository;

  GetAllTasks(this.repository);

  Future<Either<Failure, List<Tasks>>> execute() async {
    return await repository.getAllTasks();
  }
}
