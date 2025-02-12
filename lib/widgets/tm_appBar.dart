import 'package:flutter/material.dart';
import 'package:task_manager_project/Ui/Screen/SignIn_Screen.dart';
import 'package:task_manager_project/Ui/Screen/Update_profile_Screen.dart';
import 'package:task_manager_project/Ui/Utils/app_color.dart';
import 'package:get/get.dart';

class TMAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.themecolor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, UpdateProfileScreen.name);
            },
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/profile.png'), // Add an image
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align left
                  children: const [
                    Text('Tamim Hossen', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    Text('ktbtamim@gmail.com', style: TextStyle(fontSize: 12, color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Get.offAllNamed(SigninScreen.name);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Fixed implementation
}
