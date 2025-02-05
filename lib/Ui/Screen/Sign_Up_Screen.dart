import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name="/Sign-up-screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final  GlobalKey<FormState> _formKey=GlobalKey<FormState>();
 final  TextEditingController _emailTEController=TextEditingController();
 final  TextEditingController _firstNameTEController=TextEditingController();
 final  TextEditingController _lastNameTEController=TextEditingController();
 final  TextEditingController _mobileTEController=TextEditingController();
 final  TextEditingController _passwordTEController=TextEditingController();

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
                children: [
                 const SizedBox(height: 100,),
                  Row(
                    children: [
                      Text('Join With Us . . .',
                      style: textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _emailTEController,
                    decoration:const InputDecoration(labelText: 'Email'),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _firstNameTEController,
                    decoration:const InputDecoration(
                      labelText: 'First Name'
                    ),

                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _lastNameTEController,
                    decoration:const InputDecoration(
                      labelText: 'Last Name'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _mobileTEController,
                    decoration:const InputDecoration(
                      labelText: 'Mobile'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordTEController,
                    decoration:const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {},
                child:const Icon(Icons.arrow_circle_right_outlined),
              ),
                  const SizedBox(height: 40,),



                  _builSignUpSection()
            ],
              ),

            ),

          ),

      ),
    );
  }
  Widget _builSignUpSection() {
    return RichText(
      text: TextSpan(
        text:" Have an account? ",
        style: const TextStyle(
            color: Colors.black
        ),
        children: [
          TextSpan(
              text: "Sign In",
              style:const TextStyle(
                color: Colors.black26,
              ),
              recognizer : TapGestureRecognizer()
                ..onTap=(){
                  Get.toNamed(SigninScreen.name);
                }
          )
        ],
      ),
    );
  }

}
