import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_manager_project/Ui/Screen/Forgot_Password_Otp_Verification.dart';
import 'package:task_manager_project/Ui/Screen/Forgot_password_email_verify_Screen.dart';
import 'package:task_manager_project/Ui/Screen/New_Task_List_Screen.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Sign_Up_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Splash_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Update_profile_Screen.dart';
import 'package:task_manager_project/Ui/Screen/main_bottom_nav_screen.dart';
import 'package:task_manager_project/Ui/Screen/reset_password_screen.dart';
import 'package:task_manager_project/Ui/Utils/app_color.dart';

class TaskManagerApp extends StatelessWidget {
   TaskManagerApp({super.key});
  GlobalKey<NavigatorState> navigatorkey=GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.themecolor,
        textTheme: TextTheme(

          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            color: Colors.black38,
          )
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding:EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size.fromWidth(double.maxFinite),
          )
        )
      ),

      initialRoute: '/',
      navigatorKey: navigatorkey,
        onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name==SplashScreen.name){
          widget= const SplashScreen();
        }else if(settings.name ==SigninScreen.name){
          widget= SigninScreen();
        }else if(settings.name==SignUpScreen.name){
          widget=const SignUpScreen();
        }else if(settings.name==ForgotPasswordEmailVerifyScreen.name){
          widget=const ForgotPasswordEmailVerifyScreen();
        }else if(settings.name==ForgotPasswordOtpVerification.name){
          widget=const ForgotPasswordOtpVerification();
        }else if(settings.name==ResetPasswordScreen.name){
          widget=const ResetPasswordScreen();
        }else if(settings.name==MainBottomNavScreen.name){
          widget=MainBottomNavScreen();
        }else if(settings.name==UpdateProfileScreen.name){
          widget=UpdateProfileScreen();
        }else if(settings.name==NewTaskListScreen.name){
          widget=NewTaskListScreen();
        }

        return MaterialPageRoute(builder: (ctx) => widget);

      },
    );
  }
}
