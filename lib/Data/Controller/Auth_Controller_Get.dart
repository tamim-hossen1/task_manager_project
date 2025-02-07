import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Data/Controller/Auth_service.dart';
import 'package:task_manager_project/Ui/Screen/main_bottom_nav_screen.dart';

class AuthControllerGet extends GetxController {
  var isLoadding = false.obs;
  final AuthService authService = AuthService();

  void signUp(String Email, String FirstName, String LastName, String Password, String Mobile) async {
    if (Email.isEmpty || FirstName.isEmpty || LastName.isEmpty || Password.isEmpty || Mobile.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    isLoadding.value = true;

    final response = await authService.signUpUser({
      "email": Email,
      "firstName": FirstName,
      "lastName": LastName,
      "mobile": Mobile,
      "password": Password,
    });

    isLoadding.value = false;

    if (response.statusCode == 201) {
      Get.snackbar("Success", "User registration successful");
      Get.offAllNamed(MainBottomNavScreen.name);
      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
    } else {
      Get.snackbar("Error", response.body?['message'] ?? "Registration Failed");
    }
  }
}
