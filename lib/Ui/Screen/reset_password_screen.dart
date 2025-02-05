import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/main_bottom_nav_screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

import 'SignIn_Screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name='/reset-password-screen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _passwordTEController=TextEditingController();
  final TextEditingController _confirmPasswordTEController=TextEditingController();

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  int _selectedIndex=0;
  

  @override
  Widget build(BuildContext context) {

    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child:Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Text('Set Password',
                        style: textTheme.titleLarge,
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text('Minimum length password 8 character with letter and number combination.',
                    style: textTheme.titleSmall,
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _passwordTEController,
                    decoration: const InputDecoration(
                      labelText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _confirmPasswordTEController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password'
                    ),
                  ),

                  const SizedBox(height: 30,),
                  ElevatedButton(
                      onPressed: (){
                        Get.offAll(SigninScreen.name);
                },
                child: Icon(Icons.arrow_circle_right_outlined),
                  ),
                  const SizedBox(height: 30,),

                  const _buildSignInSection(),


                ],
              ),
            ),
          )
      ),
    );
  }
}

class _buildSignInSection extends StatelessWidget {
  const _buildSignInSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text:TextSpan(
            text: 'Do you have a account? ',
            style: const TextStyle(
              color: Colors.black,
            ),
            children: [
              TextSpan(
                  text: 'Sign In',
                  style: const TextStyle(
                      color: Colors.green
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap=(){
                      Get.offAllNamed(SigninScreen.name);
                    }
              )
            ]
        )
    );
  }
}

