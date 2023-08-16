import '../../domain/entities/task.dart';

// ignore: must_be_immutable
class TasksModel extends Tasks {
  TasksModel({
    required super.taskName,
    required super.date,
    required super.description,
    required super.col,
  });

  factory TasksModel.fromJson(Map<String, dynamic> json) {
    return TasksModel(
      taskName: json['taskName'],
      date: json["date"],
      description: json['description'],
      col: json['col'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'date': date,
      'description': description,
      'col': col,
    };
  }
}
