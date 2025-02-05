

import 'package:task_manager_project/Data/Model/Task_model.dart';

class TaskListBystatusModel{
  String? status;
  List<TaskModel>? taskList;

  TaskListBystatusModel({
   this.status,
   this.taskList,
});

  TaskListBystatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      taskList = <TaskModel>[];
      json['data'].forEach((v) {
        taskList!.add(TaskModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (taskList != null) {
      data['data'] = taskList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}