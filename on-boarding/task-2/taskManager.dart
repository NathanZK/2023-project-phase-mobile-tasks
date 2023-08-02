import 'dart:io';
import 'dart:math';

class Task {
  String? title, description, due_date;
  String status = 'pending';

  Task(title, description, due_date) {
    this.title = title;
    this.description = description;
    this.due_date = due_date;
  }
}

class TaskManager {
  var tasks = {};

  void addTask() {
    print("Enter Task Title:");
    var title = stdin.readLineSync();
    print("Enter Task Description");
    var description = stdin.readLineSync();
    print("Enter Due Date:");
    var due_date = stdin.readLineSync();

    Random random = new Random();
    var randID = (random.nextInt(100) + 1).toString();
    while (tasks.containsKey(randID)) {
      randID = (random.nextInt(100) + 1).toString();
    }
    tasks[randID] = Task(title, description, due_date);
    print("\nTask Successfully Added.\nPress any key to get back to main Menu");
    var key = stdin.readLineSync();
    print("");
  }

  void viewAllTasks() {
    for (var entry in tasks.entries) {
      var id = entry.key;
      var task = entry.value;
      print("Task Id: $id");
      printTask(task);
    }
    if (tasks.length > 0) {
      updateTask();
    } else {
      print("You currently have no tasks!");
    }
  }

  void viewCompletedTasks() {
    var count = 0;

    for (var entry in tasks.entries) {
      var id = entry.key;
      var task = entry.value;
      if (task.status == "completed") {
        count++;
        print("Task Id: $id");
        printTask(task);
      }
    }
    if (count > 0) {
      updateTask();
    } else {
      print("You currently have no completed tasks");
    }
  }

  void viewPendingTasks() {
    var count = 0;

    for (var entry in tasks.entries) {
      var id = entry.key;
      var task = entry.value;
      if (task.status == "pending") {
        count++;
        print("Task Id: $id");
        printTask(task);
      }
    }
    if (count > 0) {
      updateTask();
    } else {
      print("You currently have no pending tasks");
    }
  }

  void printTask(Task task) {
    print("Title: ${task.title}");
    print("Description: ${task.description}");
    print("Due Date: ${task.due_date}");
    print("Task Status: ${task.status}\n");
  }

  void updateTask() {
    print("Type the id of the task in order to Edit or Delete it");
    print("Press any other key to get back to Main Menu\n");

    var taskId = stdin.readLineSync();
    if (tasks.containsKey(taskId)) {
      print("1. Edit Task");
      print("2. Delete Task\n");

      var choice = stdin.readLineSync();
      if (choice == "1") {
        editTask(taskId);
      } else if (choice == "2") {
        deleteTask(taskId);
      }
    }
  }

  void deleteTask(taskId) {
    tasks.remove(taskId);
    print("Task with id $taskId Successfully Deleted\n");
  }

  void editTask(taskId) {
    print("Select an option to change");
    print("1.Title");
    print("2.Decription");
    print("3.Due Date");
    if (tasks[taskId].status == "pending") {
      print("4.Change Status to completed\n");
    } else {
      print("4.Change Status to Pending\n");
    }

    var choice = stdin.readLineSync();
    if (choice == "1") {
      print("Enter new Title:");
      var title = stdin.readLineSync();
      tasks[taskId].title = title;
      print("Your task title has been updated\n");
    } else if (choice == "2") {
      print("Enter new description:");
      var description = stdin.readLineSync();
      tasks[taskId].description = description;
      print("Your task description has been updated\n");
    } else if (choice == "3") {
      print("Enter new due date:");
      var due_date = stdin.readLineSync();
      tasks[taskId].due_date = due_date;
      print("Your task due date has been updated");
    } else if (choice == "4") {
      if (tasks[taskId].status == "pending") {
        print("Your task status has been updated to Completed\n");
        tasks[taskId].status = "completed";
      } else {
        print("Your task status has been updated to Pending\n");
        tasks[taskId].status = "pending";
      }
    }
  }
}

void main() {
  TaskManager taskManager = TaskManager();
  print("Welcome to a TaskManager Application\n");

  while (true) {
    print("1. Add a new task");
    print("2. View all tasks");
    print("3. View only completed tasks");
    print("4. View only pending tasks");
    print("Press any other key to Exit\n");

    var choice = stdin.readLineSync();
    if (choice == "1") {
      taskManager.addTask();
    } else if (choice == "2") {
      taskManager.viewAllTasks();
    } else if (choice == "3") {
      taskManager.viewCompletedTasks();
    } else if (choice == "4") {
      taskManager.viewPendingTasks();
    } else {
      break;
    }
  }
}
