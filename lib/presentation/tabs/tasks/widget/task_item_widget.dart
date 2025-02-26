import 'package:flutter/material.dart';
import 'package:todo_list/core/utils/routes_manager.dart';

class TaskItemWidget extends StatelessWidget {
  TaskItemWidget({super.key, this.taskName, this.taskDescription});
  String? taskName;
  String? taskDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.blue),
        width: double.infinity,
        height: 120,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Task Descriptionsdfvsssssssssssssssssssssssss",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.update,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManager.updateTask);
                      print("PRESSED");
                    },
                  ),
                  InkWell(
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onTap: () {
                      deleteTask();
                      print("PRESSED");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteTask() {}
}
