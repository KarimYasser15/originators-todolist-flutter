import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/config/app_styles.dart';
import 'package:todo_list/features/my_tasks/screens/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  List<Widget> tabs = [
    TasksTab(),
    Scaffold(
      backgroundColor: Colors.red,
    ),
    TasksTab(),
    TasksTab()
  ];
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
