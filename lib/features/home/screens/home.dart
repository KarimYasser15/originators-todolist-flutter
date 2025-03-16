import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/home/widgets/app_bar_drawer.dart';
import 'package:todo_list/features/settings/view/settings_tab.dart';
import 'package:todo_list/features/tasks/view/tasks_tab.dart';

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
    SettingsTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(AssetsManager.bellIcon)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.black,
              )),
        ],
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                AssetsManager.drawerIcon,
              )),
        ),
      ),
      drawer: AppBarDrawer(),
      body: tabs[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value != 2) {
              setState(() {
                selectedTab = value;
              });
            }
          },
          currentIndex: selectedTab,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsManager.homeIcon,
                  colorFilter: ColorFilter.mode(
                      selectedTab == 0
                          ? ColorsManager.choosenColor
                          : ColorsManager.black,
                      BlendMode.srcATop),
                ),
                label: StringsManager.home),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsManager.calenderIcon,
                  colorFilter: ColorFilter.mode(
                      selectedTab == 1
                          ? ColorsManager.choosenColor
                          : ColorsManager.black,
                      BlendMode.srcATop),
                ),
                label: StringsManager.calender),
            BottomNavigationBarItem(icon: Container(), label: ''),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsManager.searchIcon,
                  colorFilter: ColorFilter.mode(
                      selectedTab == 3
                          ? ColorsManager.choosenColor
                          : ColorsManager.black,
                      BlendMode.srcATop),
                ),
                label: StringsManager.search),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetsManager.userIcon,
                  colorFilter: ColorFilter.mode(
                      selectedTab == 4
                          ? ColorsManager.choosenColor
                          : ColorsManager.black,
                      BlendMode.srcATop),
                ),
                label: StringsManager.profile),
          ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 40),
          onPressed: () {
            // viewModel.isTasksSelected
            //     ? viewModel.deleteAllOrMany()
            //     : showModalBottomSheet(
            //         isScrollControlled: true,
            //         context: context,
            //         builder: (_) => AddTaskBottomSheetWidget(
            //           viewModel: viewModel,
            //         ),
            //       );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
