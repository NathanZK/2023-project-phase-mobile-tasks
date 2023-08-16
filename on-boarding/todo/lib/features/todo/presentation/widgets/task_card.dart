import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/features/todo/presentation/widgets/task_checkbox.dart';

import '../../domain/entities/task.dart';

class TaskCard extends StatefulWidget {
  final Tasks task;

  const TaskCard({
    super.key,
    required this.task,
    required this.onEdit,
  });

  final VoidCallback onEdit;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;
  var currDate = DateFormat.yMMMd().format(DateTime.now());

  List<Color> cols = [
    Colors.green,
    Colors.yellow,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onEdit,
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
                    widget.task.taskName[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: Text(
                      widget.task.taskName,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                        widget.task.date,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      TaskCheckbox(
                        isChecked: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
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
                        decoration: BoxDecoration(
                          color: isChecked
                              ? cols[0]
                              : currDate.compareTo(widget.task.date) <= 0
                                  ? cols[widget.task.col]
                                  : cols[2],
                        ),
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
