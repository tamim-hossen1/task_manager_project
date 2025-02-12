import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Data/Controller/count_task_by_status_controller.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';
import 'package:task_manager_project/widgets/tm_appBar.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  static const String name='/new-task-list-screen';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppbar(),
      body: ScreenBackground(
        child: Column(
          children: [
            Center(
              child: Text('NEW TASK LIST SCREEN'),
            )
    ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed:(){
              
            },
          child: Icon(Icons.add),
        ),
    );
  }
}
