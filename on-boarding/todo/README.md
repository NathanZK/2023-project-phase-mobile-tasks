# Todo App with Navigation and Routing

This Flutter project demonstrates the implementation of navigation and routing features in a simple TODO mobile app. The app allows users to manage tasks by creating, viewing, and editing them. It leverages Flutter's built-in navigation methods, named routes, and smooth navigation animations to provide a seamless user experience.

## Features

- Home screen: Displays a list of all tasks.
- Add Task screen: Lets users create new tasks with titles and descriptions.
- View Task screen: Allows users to view details of existing tasks.

## Getting Started

Follow these steps to run the app on your local machine:

1. Clone the repository:

```bash
[git clone https://github.com/your-username/todo-app.git](https://github.com/NathanZK/2023-project-phase-mobile-tasks.git)
```

2. Navigate to the project directory:

```bash
cd on-boarding/todo
```

3. Install dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## Navigation

The app utilizes Flutter's named routes for navigation, which provides a cleaner and more maintainable way to manage different screens. Each screen is associated with a unique route name.

Navigation between screens is achieved using the `Navigator` widget and the `onPressed` callbacks on buttons or user interactions.

## Passing Data

When creating a new task, the user can input the task's title and description. The entered data is passed between screens using the `ModalRoute` and `Navigator` classes. This ensures that the data is preserved across different screens and actions.
