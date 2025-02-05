import 'package:flutter/material.dart';
import 'package:task_manager_project/Ui/Screen/Cancelled_Task_List_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Completed_Task_List_Screen.dart';
import 'package:task_manager_project/Ui/Screen/New_Task_List_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Progress_task_list_Screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name='/main-bottom-nav-screen';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex=0;

  List<Widget>  _Screen=[
    NewTaskListScreen(),
    ProgressTaskListScreen(),
    CompletedTaskListScreen(),
    CancelledTaskListScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (index){
          _selectedIndex=index;
          setState(() {});
          },
          destinations:[
            NavigationDestination(icon: Icon(Icons.new_label_outlined), label:'New'),
            NavigationDestination(icon: Icon(Icons.refresh), label:'Progress'),
            NavigationDestination(icon: Icon(Icons.done), label: 'completed'),
            NavigationDestination(icon: Icon(Icons.cancel_outlined), label: 'cancelled'),
          ]
      ),
    );
  }
}
