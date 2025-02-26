import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/theme/app_styles.dart';
import 'package:todo_list/presentation/tabs/tasks/task_provider.dart';
import 'package:todo_list/presentation/tabs/tasks/widget/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/presentation/tabs/tasks/widget/task_item_widget.dart';
import 'package:todo_list/presentation/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [TasksTab(), TasksTab(), TasksTab(), TasksTab()];
  List<String> selectedTabAppbarTitle = [
    "My Tasks",
    "Social Media",
    "My Profile",
    "Settings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedTabAppbarTitle[selectedTab],
          style: AppStyles.appBarStyle,
        ),
        backgroundColor: Colors.blue,
      ),
      body: tabs[selectedTab],
      backgroundColor: Colors.white,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                selectedTab = value;
              });
            },
            currentIndex: selectedTab,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.view_list,
                  ),
                  label: "My Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.social_distance,
                  ),
                  label: "Social Media"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "My Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
    );
  }
}
