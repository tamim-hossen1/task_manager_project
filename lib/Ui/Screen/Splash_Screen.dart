import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/Ui/Utils/Assets_path.dart';
import 'package:task_manager_project/widgets/AppLogo.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name="/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    MoveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
      child: ScreenBackground(
        child: Center(
          child: Applogo(),
        ),
      ),
    );
  }

  Future<void> MoveToNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, SigninScreen.name);
  }
}
