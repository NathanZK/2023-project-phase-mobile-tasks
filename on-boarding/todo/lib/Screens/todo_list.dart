import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../app_bar.dart';

// ignore: must_be_immutable
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Tasks> tasks = [
    Tasks(
      taskName: "UI/UX App Design",
      date: "April 29, 2023",
      col: 0,
      description:
          "First I have to animate the logo and prototyping my design. It’s very important.",
    ),
    Tasks(
      taskName: "View Candidates",
      date: "April 29, 2023",
      col: 3,
      description: "This is task description for View Candidates",
    ),
    Tasks(
      taskName: "Footbal Cup Dribbling",
      date: "April 29, 2023",
      col: 2,
      description: "This is task description for Footbal Cup Dribbling",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: 'Todo List',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Image(
                width: 220,
                height: 220,
                image: AssetImage('assets/images/stickman-with-todo-list.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 0, 0),
              child: Text(
                "Tasks List",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 5),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  onEdit: () async {
                    var updatedTask = await Navigator.pushNamed(
                      context,
                      '/taskDetail',
                      arguments: {
                        'duedate': tasks[index].date,
                        'description': tasks[index].description,
                        'taskName': tasks[index].taskName,
                      },
                    );
                    if (updatedTask != null) {
                      final _updatedTask = updatedTask as Map;
                      setState(
                        () {
                          if (_updatedTask['taskName'] != null) {
                            tasks[index].taskName = _updatedTask['taskName'];
                          }
                          if (_updatedTask['duedate'] != null) {
                            tasks[index].date = _updatedTask['duedate'];
                          }
                          if (_updatedTask['description'] != null) {
                            tasks[index].description =
                                _updatedTask['description'];
                          }
                        },
                      );
                    }
                  },
                  task: tasks[index],
                );
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    final result =
                        await Navigator.pushNamed(context, '/addTask');
                    if (result != null) {
                      setState(() => tasks.add(
                            result as Tasks,
                          ));
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFEE6F57),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: const Text(
                    "Create Task",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TaskCard extends StatelessWidget {
  final Tasks task;

  TaskCard({
    super.key,
    required this.task,
    required this.onEdit,
  });

  final VoidCallback onEdit;

  List<Color> cols = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.green,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        margin: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 17, 5),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    task.taskName[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Text(
                      task.taskName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.5,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        task.date,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: SizedBox(
                      height: 45,
                      width: 3.5,
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: cols[task.col]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Tasks extends Equatable {
  String taskName, date, description;
  int col;

  Tasks(
      {required this.taskName,
      required this.date,
      required this.description,
      required this.col});

  @override
  List<Object?> get props => [taskName, date, description, col];
}
