import 'package:flutter/material.dart';

import '../app_bar.dart';

// ignore: must_be_immutable
class TodoList extends StatelessWidget {
  TodoList({super.key});

  List<Task> tasks = [
    Task(
      taskName: "UI/UX App Design",
      date: "April 29, 2023",
      col: 0,
      description:
          "First I have to animate the logo and prototyping my design. It’s very important.",
    ),
    Task(
      taskName: "View Candidates",
      date: "April 29, 2023",
      col: 3,
      description: "This is task description for View Candidates",
    ),
    Task(
      taskName: "Footbal Cup Dribbling",
      date: "April 29, 2023",
      col: 2,
      description: "This is task description for Footbal Cup Dribbling",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null) {
      tasks.add(Task(
        taskName: args['taskName'],
        date: args['date'],
        col: args['col'],
        description: args['description'],
      ));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: 'Todo List',
      ),
      body: Column(
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
              return Task(
                taskName: tasks[index].taskName,
                date: tasks[index].date,
                col: tasks[index].col,
                description: tasks[index].description,
              );
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: SizedBox(
              width: 250,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTask');
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
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class Task extends StatelessWidget {
  final String taskName, date, description;
  final int col;

  Task({
    super.key,
    required this.taskName,
    required this.date,
    required this.description,
    required this.col,
  });

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
      onTap: () {
        Navigator.pushNamed(
          context,
          '/taskDetail',
          arguments: {
            'duedate': date,
            'description': description,
            'taskName': taskName,
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                  color: const Color.fromARGB(255, 224, 228, 224), width: 1.5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                taskName[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 50,
                width: 100,
                child: Text(
                  taskName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 90),
              Column(
                children: [
                  Text(
                    date,
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
              const SizedBox(width: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: SizedBox(
                  height: 45,
                  width: 3.5,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: cols[col]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
