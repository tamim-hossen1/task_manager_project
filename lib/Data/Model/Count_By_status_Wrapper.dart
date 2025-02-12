import 'package:task_manager_project/Data/Model/task_count_by_stauts_data.dart';

class CountByStatusWrapper{
   String? status;
   List<TaskCountByStatusData>? listofTaskByStatusData;

   CountByStatusWrapper({
     this.status,
     this.listofTaskByStatusData
});

   CountByStatusWrapper.fromJson(Map<String,dynamic> json){
     status=json["status"];
     if(json['data'] != null){
       listofTaskByStatusData=<TaskCountByStatusData>[];
       json['data'].forEach(
           (v){
             listofTaskByStatusData!.add(TaskCountByStatusData.fromJson(v));
           }
       );
     }
   }




}