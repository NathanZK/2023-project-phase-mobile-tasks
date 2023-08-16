import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const TaskCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      if (isChecked) {
        return Colors.green;
      }
      return Colors.grey;
    }

    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      fillColor:
          MaterialStateProperty.resolveWith((states) => getColor(states)),
      onChanged: onChanged,
    );
  }
}

// ignore: must_be_immutable
