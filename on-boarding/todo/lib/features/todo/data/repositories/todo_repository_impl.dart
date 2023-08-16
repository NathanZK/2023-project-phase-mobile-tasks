import 'package:dartz/dartz.dart';
import 'package:todo/core/error/failures.dart';
import 'package:todo/core/platform/network_info.dart';
import 'package:todo/features/todo/data/datasources/todo_app_local_data_source.dart';
import 'package:todo/features/todo/data/datasources/todo_app_remote_data_source.dart';
import 'package:todo/features/todo/domain/entities/task.dart';
import 'package:todo/features/todo/domain/repositories/todo_repository.dart';

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
  Future<Either<Failure, Tasks>> createTask(Tasks task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Tasks>>> viewAllTasks() {
    // TODO: implement viewAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Tasks>> viewTask(Tasks task) {
    // TODO: implement viewTask
    throw UnimplementedError();
  }
}
