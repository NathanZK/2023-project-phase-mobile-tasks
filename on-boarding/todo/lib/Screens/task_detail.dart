import 'package:flutter/material.dart';

import '../app_bar.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String taskName = args['taskName'];
    final String duedate = args['duedate'];
    final String description = args['description'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        title: 'Task Detail',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Image(
              width: 220,
              height: 220,
              image: AssetImage('assets/images/shopping-list.png'),
            ),
          ),
          CustomField(
            minLine: 1,
            fieldTitle: "Title",
            fieldText: taskName,
          ),
          CustomField(
              minLine: 4, fieldTitle: "Description", fieldText: description),
          CustomField(
            minLine: 1,
            fieldTitle: "Deadline",
            fieldText: duedate,
          ),
        ],
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  final int minLine;
  final String fieldTitle, fieldText;

  const CustomField(
      {super.key,
      required this.minLine,
      required this.fieldText,
      required this.fieldTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: const Color(0xFFF1EEEE),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color(0xFFF1EEEE),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: fieldText,
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            minLines: minLine,
            maxLines: 6,
          )
        ],
      ),
    );
  }
}
