import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Data/Controller/Auth_Controller_Get.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = "/Sign-up-screen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final AuthControllerGet controllerGet = Get.put(AuthControllerGet());

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ScreenBackground(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Row(
                  children: [
                    Text(
                      'Join With Us . . .',
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!GetUtils.isEmail(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'First name is required' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Last name is required' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: const InputDecoration(labelText: 'Mobile'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile number is required';
                    }
                    if (!GetUtils.isPhoneNumber(value)) {
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Obx(() {
                  if (controllerGet.isLoadding.value) {
                    return const CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controllerGet.signUp(
                          _emailTEController.text.trim(),
                          _firstNameTEController.text.trim(),
                          _lastNameTEController.text.trim(),
                          _passwordTEController.text,
                          _mobileTEController.text.trim(),
                        );
                      }
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  );
                }),
                const SizedBox(height: 40),
                _buildSignUpSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: " Have an account? ",
        style: const TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: "Sign In",
            style: const TextStyle(color: Colors.black26),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.toNamed(SigninScreen.name);
              },
          ),
        ],
      ),
    );
  }
}
