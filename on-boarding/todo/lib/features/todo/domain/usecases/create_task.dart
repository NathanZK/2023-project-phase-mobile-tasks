import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';

class CreateTask implements UseCase<Tasks, Params> {
  final TodoRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, Tasks>> call(Params params) async {
    return await repository.createTask(params.tasks);
  }
}

class Params extends Equatable {
  final Tasks tasks;
  const Params({required this.tasks});

  @override
  List<Object> get props => [tasks];
}