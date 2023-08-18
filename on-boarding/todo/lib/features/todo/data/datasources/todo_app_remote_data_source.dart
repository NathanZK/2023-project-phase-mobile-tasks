import 'dart:convert';
import 'package:http/http.dart' as http; // Import http package with an alias
import 'package:todo/core/error/exceptions.dart';

import '../../domain/entities/task.dart';
import '../models/tasks_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TasksModel>> viewAllTasks();
  Future<TasksModel> createTask(Tasks task);
  Future<TasksModel> viewTask(Tasks task);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImpl({required this.client});

  @override
  Future<TasksModel> createTask(Tasks task) {
    // TODO: implement createTask
    throw UnimplementedError();
  }

  @override
  Future<List<TasksModel>> viewAllTasks() async {
    final response = await client.get(
      'https://mock-todo-api-ib6b.onrender.com/api/v1/todo' as Uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> tasksJson = jsonDecode(response.body);
      final List<TasksModel> tasksList =
          tasksJson.map((taskJson) => TasksModel.fromJson(taskJson)).toList();
      return tasksList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TasksModel> viewTask(Tasks task) async {
    final response = await client.get(
      'https://mock-todo-api-ib6b.onrender.com/api/v1/todo' as Uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final dynamic taskJson = jsonDecode(response.body);
      final TasksModel taskModel = TasksModel.fromJson(taskJson);
      return taskModel;
    } else {
      throw ServerException();
    }
  }
}
