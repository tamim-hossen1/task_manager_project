class TaskModel{
  String? sId;
  String? title;
  String? description;
  String? status;
  String? creatDate;

  TaskModel({
    this.sId,
    this.title,
    this.description,
    this.status,
    this.creatDate
});

  TaskModel.fromJson(Map<String,dynamic> json){
    sId=json['_id'];
    title=json['title'];
    description=json['description'];
    status=json['status'];
    creatDate=json['createdate'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=new Map<String,dynamic>();

    data['id']=this.sId;
    data['title']=this.title;
    data['description']=this.description;
    data['status']=this.status;
    data['createDate']=this.creatDate;

    return data;


  }

}