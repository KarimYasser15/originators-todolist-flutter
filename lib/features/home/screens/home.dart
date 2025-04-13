import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/routes_manager.dart';
import 'package:todo_list/core/utils/assets_manager.dart';
import 'package:todo_list/core/utils/colors_manager.dart';
import 'package:todo_list/core/utils/strings_manager.dart';
import 'package:todo_list/features/home/widgets/app_bar_drawer.dart';
import 'package:todo_list/features/settings/view/screens/settings_screen.dart';
import 'package:todo_list/features/tasks/view/tasks_tab.dart';
import 'package:todo_list/features/home/widgets/add_task_bottom_sheet_widget.dart';
import 'package:todo_list/features/tasks/view_model/tasks_view_model.dart';

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
    Scaffold(
      backgroundColor: Colors.red,
    )
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
      drawer: AppBarDrawer(
        onDrawerItemClicked: onDrawerItemClicked,
      ),
      body: tabs[selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 4) {
              Navigator.pushNamed(context, RoutesManager.settingsScreen);
            } else if (value != 2) {
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
                  AssetsManager.settings,
                  colorFilter: ColorFilter.mode(
                      selectedTab == 4
                          ? ColorsManager.choosenColor
                          : ColorsManager.black,
                      BlendMode.srcATop),
                ),
                label: StringsManager.settings),
          ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, size: 40),
          onPressed: () {
            // viewModel.isTasksSelected
            //     ? viewModel.deleteAllOrMany()
            showModalBottomSheet(
              isDismissible: true,
              isScrollControlled: true,
              enableDrag: true,
              context: context,
              builder: (_) => AddTaskBottomSheetWidget(
                viewModel: Provider.of<TasksViewModel>(context),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onDrawerItemClicked(DrawerItem item) {
    setState(() {
      switch (item) {
        case DrawerItem.trash:
          {
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesManager.trash);
          }
        case DrawerItem.profile:
          {}
        case DrawerItem.friends:
          {}
        case DrawerItem.settings:
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesManager.settingsScreen);

          break;
      }
    });
  }
}
