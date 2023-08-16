import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/task.dart';

class ViewTask implements UseCase<Tasks, Params> {
  final TodoRepository repository;

  ViewTask(this.repository);

  @override
  Future<Either<Failure, Tasks>> call(Params params) async {
    return await repository.viewTask(params.task);
  }
}

class Params extends Equatable {
  final Tasks task;
  const Params({required this.task});

  @override
  List<Object> get props => [task];
}
