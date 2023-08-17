import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/error/exceptions.dart';
import 'package:todo/features/todo/data/models/tasks_model.dart';

abstract class TodoLocalDataSource {
  Future<void> cacheTodoList(List<TasksModel> todoListToCache);
  Future<List<TasksModel>> getAllTasks();
}

const CACHED_TODO_LIST = 'CACHED_TODO_LIST';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final SharedPreferences sharedPreferences;

  TodoLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheTodoList(List<TasksModel> todoListToCache) {
    final List<String> jsonList = [];

    for (var todo in todoListToCache) {
      jsonList.add(jsonEncode(todo.toJson()));
    }
    return sharedPreferences.setStringList(CACHED_TODO_LIST, jsonList);
  }

  @override
  Future<List<TasksModel>> getAllTasks() {
    final jsonString = sharedPreferences.getString(CACHED_TODO_LIST);
    if (jsonString != null) {
      return Future.value(TasksModel.fromJson(jsonDecode(jsonString))
          as FutureOr<List<TasksModel>>?);
    } else {
      throw CacheException();
    }
  }
}
