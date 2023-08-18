import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Tasks extends Equatable {
  String taskName, date, description;
  int col;

  var id;

  Tasks(
      {required this.taskName,
      required this.date,
      required this.description,
      required this.col});

  @override
  List<Object?> get props => [taskName, date, description, col];
}
