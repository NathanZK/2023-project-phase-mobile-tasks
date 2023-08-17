import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/network/network_info.dart';
import 'package:todo/features/todo/data/datasources/todo_app_local_data_source.dart';
import 'package:todo/features/todo/data/datasources/todo_app_remote_data_source.dart';
import 'package:todo/features/todo/data/models/tasks_model.dart';
import 'package:todo/features/todo/domain/entities/task.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

import '../../../../core/error/exceptions.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;
  final TodoLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TodoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Tasks>> createTask(Tasks task) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasksList = await remoteDataSource.viewAllTasks();
        localDataSource.cacheTodoList(remoteTasksList);
        return Right(remoteTasksList);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getAllTasks();
        return Right(localTasks);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Tasks>> viewTask(Tasks task) async {
    try {
      final remoteTask = await remoteDataSource.viewTask(task);
      return Right(remoteTask);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
