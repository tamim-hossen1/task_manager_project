import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Data/Controller/Auth_service.dart';
import 'package:task_manager_project/Data/Controller/Auth_Controller.dart';
import 'package:task_manager_project/Data/Model/Task_model.dart';
import 'package:task_manager_project/Ui/Screen/main_bottom_nav_screen.dart';

class AuthControllerGet extends GetxController {
  var isLoadding = false.obs;
  var postList=<TaskModel>[].obs;

  final AuthService authService = AuthService();

  Future<void> signUp(String email, String firstName, String lastName, String password, String mobile) async {
    if (email.isEmpty || firstName.isEmpty || lastName.isEmpty || password.isEmpty || mobile.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    isLoadding.value = true;

    final response = await authService.signUpUser({
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "password": password,
    });

    isLoadding.value = false;

    if(response.statusCode==200){
      Get.snackbar("success", 'User sign in successful');
      debugPrint('Response body : ${response.body}');
    }else{
      String errormessage=response.body['message']
          ?? 'something went wrong';
      Get.snackbar('Error', errormessage);
      debugPrint("Error response : ${response.body}");
    }
  }

  Future<void> SignIn(String email,String password) async{
    isLoadding.value=true;
    final response=await authService.signIn({
      "email" : email,
      "password" :password,
    });
    isLoadding.value=false;

    if(response.statusCode==200){
      Get.snackbar("success", 'User sign in successful');
      debugPrint('Response body : ${response.body}');
    }else{
      String errormessage=response.body['message']
          ?? 'something went wrong';
      Get.snackbar('Error', errormessage);
      debugPrint("Error response : ${response.body}");
    }

  }


  void fetchdata() async{
    try{
      isLoadding(true);
      final response=await authService.fetchPosts();
      if(response != null){
        postList.assignAll(
          response.map((json)=>
          TaskModel.fromJson(json)
          ).toList()
        );

      }
    }catch(e){
      Get.snackbar('Error', e.toString());
    }finally{
      isLoadding(false);
    }
  }

}
