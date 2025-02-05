import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/Forgot_password_email_verify_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Sign_Up_Screen.dart';
import 'package:task_manager_project/Ui/Screen/main_bottom_nav_screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static const String name="/SignInScreen";

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}



class _SigninScreenState extends State<SigninScreen> {





  final TextEditingController _emailTEController=TextEditingController();
  final TextEditingController _passwordTEController=TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100,),
                  Text('Get Started With',style: textTheme.titleLarge,),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                        labelText: "Email"
                    ),

                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
                      },
                      child: const Icon(Icons.arrow_circle_right_outlined),
                  ),

                  const SizedBox(height: 40,),
            TextButton(
                onPressed: () {

                 Get.offAllNamed(ForgotPasswordEmailVerifyScreen.name);
                },
                child:const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.green
                  ),
                  )),

                  const SizedBox(height: 5,),
                  const _builSignUpSection()


                ],
              ),
            ),


          )
      )
    );

  }
}

class _builSignUpSection extends StatelessWidget {
  const _builSignUpSection();

  @override
  Widget build(BuildContext context) {
    return RichText(
        text:TextSpan(
          text:"Don't Have an Account?",
          style: const TextStyle(
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'Sign Up',
              style:const TextStyle(
                color: Colors.green
              ),
              recognizer: TapGestureRecognizer()..onTap=(){
                Get.toNamed(SignUpScreen.name);
              }
            )
          ]
        ),
    );
  }
}
