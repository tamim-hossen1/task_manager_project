import 'package:task_manager_project/Data/Model/Count_By_status_Wrapper.dart';

import '../Task_model.dart';

class TaskListWrapper {
  String? status;
  List<TaskModel>? taskList;

  TaskListWrapper({this.status, this.taskList});

  TaskListWrapper.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json["data"] != null) {
      taskList = <TaskModel>[];
      json["data"].forEach(
            (v) {
          taskList!.add(TaskModel.fromJson(v));
        },
      );
    }
  }


}