import 'package:flutter/material.dart';
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
