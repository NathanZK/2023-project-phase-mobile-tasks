import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 110,
          title: const Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Center(
              child: Text(
                'Create new task',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFEE6F57),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 40.0,
              ),
              color: Colors.black,
            )
          ],
        ),
        body: Column(
          children: [
            const TaskName(),
            const DueDate(),
            const Description(),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFEE6F57),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ))),
                  child: const Text(
                    "Add Task",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class TaskName extends StatelessWidget {
  const TaskName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 25, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Main task name",
              style: TextStyle(
                color: Color(0xFFFC998C),
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 244, 243, 243),
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: "UI/UX App Design",
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class DueDate extends StatelessWidget {
  const DueDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 25, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Due Date",
              style: TextStyle(
                color: Color(0xFFFC998C),
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Color.fromARGB(255, 244, 243, 243),
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              hintText: "April 29,2023 12:30AM",
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.calendar_month,
                  color: Color(0xFFFC998C),
                ),
                onPressed: () {},
              ),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 25, 50, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              "Description",
              style: TextStyle(
                color: Color(0xFFFC998C),
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 100,
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 2,
                    color: Color.fromARGB(255, 244, 243, 243),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText:
                    "First I have to animate the logo and later prototyping my design. It's very important.",
              ),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.5,
              ),
              maxLines: 3,
              minLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
