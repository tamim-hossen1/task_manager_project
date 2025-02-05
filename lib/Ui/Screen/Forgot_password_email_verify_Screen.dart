import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/Forgot_Password_Otp_Verification.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class ForgotPasswordEmailVerifyScreen extends StatefulWidget {
  const ForgotPasswordEmailVerifyScreen({super.key});

  static const String name='/Forgot-password-email-verify';

  @override
  State<ForgotPasswordEmailVerifyScreen> createState() => _ForgotPasswordEmailVerifyScreenState();
}

class _ForgotPasswordEmailVerifyScreenState extends State<ForgotPasswordEmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {

    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child:Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 100,),
                Row(children: [
                  Text('Enter Your Email Here . . .',
                  style: textTheme.titleLarge,
                  )
                ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('A six digit Verification pin send to you Email.',
                    style: textTheme.titleSmall,)
                  ],
                ),

                const SizedBox(height: 20,),

                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email'
                  ),
                ),
                const SizedBox( height: 30,),

               ElevatedButton(onPressed: (){
                 Get.offAllNamed(ForgotPasswordOtpVerification.name);
               }, child: Icon(Icons.arrow_circle_right_outlined)),
               const SizedBox(height: 20,),

               const _buildSignInSection()


              ],
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
                Get.offAll(ForgotPasswordOtpVerification.name);
                }
            )
          ]
        )
    );
  }
}
