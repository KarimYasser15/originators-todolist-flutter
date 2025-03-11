import 'package:flutter/material.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Restore All Todos"),
            ElevatedButton(
                onPressed: () => TasksViewModel().restoreAllTodos(),
                child: Text(
                  "Restore",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red))
          ],
        ),
      )),
    );
  }
}
