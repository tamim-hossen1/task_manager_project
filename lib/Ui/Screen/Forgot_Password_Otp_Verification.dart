import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/reset_password_screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'SignIn_Screen.dart';

class ForgotPasswordOtpVerification extends StatefulWidget {
  const ForgotPasswordOtpVerification({super.key});

  static const String name='/Forgot-password-otp-verifications';

  @override
  State<ForgotPasswordOtpVerification> createState() => _ForgotPasswordOtpVerificationState();
}

class _ForgotPasswordOtpVerificationState extends State<ForgotPasswordOtpVerification> {
  @override
  final TextEditingController _otpTEController = TextEditingController();
  Widget build(BuildContext context) {

    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
          child:Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const SizedBox(height: 50,),
                Row(
                  children: [
                    Text('Pin Verifications',
                      style:textTheme.titleLarge,

                    )
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Text('A 6 digits Verification pin send to your Email.',
                    style: textTheme.titleSmall,
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                _buildPinCodeTextField(),

                const SizedBox(height: 20,),

                ElevatedButton(onPressed: (){
                  Get.offAllNamed(ResetPasswordScreen.name);
                },
                    child: Icon(Icons.arrow_circle_right_outlined)),

                const SizedBox(height: 30,),
               const  _buildSignInSection(),
                


              ],
            ),
          )
      ),
    );
  }
  Widget _buildPinCodeTextField() {
    return PinCodeTextField(
      length: 6,
      animationType: AnimationType.fade,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        selectedFillColor: Colors.white,
        inactiveFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      controller: _otpTEController,
      appContext: context,
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
                      Get.offAll(SigninScreen.name);
                    }
              )
            ]
        )
    );
  }
}


