class TaskModel {
  String? sId;
  String? title;
  String? description;
  String? status;
  String? createdDate;


  TaskModel({
    this.sId,
    this.title,
    this.description,
    this.status,
    this.createdDate,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      sId: json["_id"],
      title: json["title"],
      description: json["description"],
      status: json["status"],
      createdDate: json["createdDate"],
    );
  }
}
