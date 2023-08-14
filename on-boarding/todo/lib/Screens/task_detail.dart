import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../app_bar.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    String taskName = args?['taskName'] ?? 'Default Task Name';
    String duedate = args?['duedate'] ?? 'Default Due Date';
    String description = args?['description'] ?? 'Default Description';

    final TextEditingController _taskName =
        TextEditingController(text: taskName);
    final TextEditingController _dueDate = TextEditingController(text: duedate);
    final TextEditingController _description =
        TextEditingController(text: description);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        title: 'Task Detail',
        onPress: () {
          Navigator.pop(context, {
            "taskName": _taskName.text,
            "duedate": _dueDate.text,
            "description": _description.text,
          });
        },
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
            controller: _taskName,
          ),
          CustomField(
            minLine: 4,
            fieldTitle: "Description",
            controller: _description,
          ),
          CustomField(
            minLine: 1,
            fieldTitle: "Deadline",
            controller: _dueDate,
          ),
        ],
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  final int minLine;
  final String fieldTitle;
  final TextEditingController controller;

  const CustomField({
    Key? key,
    required this.minLine,
    required this.fieldTitle,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 12, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldTitle,
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
              hintStyle: const TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () async {
              if (widget.fieldTitle == "Deadline") {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if (pickedDate != null) {
                  String formattedDate = DateFormat.yMMMd().format(pickedDate);
                  setState(() {
                    widget.controller.text = formattedDate;
                  });
                }
              }
            },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            controller: widget.controller,
            minLines: widget.minLine,
            maxLines: 6,
          )
        ],
      ),
    );
  }
}
