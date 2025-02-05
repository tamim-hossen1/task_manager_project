import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/Ui/Screen/New_Task_List_Screen.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';
import 'package:task_manager_project/widgets/tm_appBar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  static const String name='/Update-profile-screen';

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      appBar: TMAppbar(),
      body: ScreenBackground(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Text('Update This Profile',
                    style: textTheme.titleLarge,
                  ),
                  const SizedBox(height: 20,),
                  _buildPhotoPicker(),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'First Name'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration:const InputDecoration(
                      labelText: 'Last Name'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText:'Mobile'
                    ),
                  ),
                  const SizedBox( height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password'
                    ),
                  ),
                  const SizedBox(height: 30,),

                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed(NewTaskListScreen.name);
                      },
                      child:Icon(Icons.arrow_circle_right_outlined),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget _buildPhotoPicker() {
    return GestureDetector(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8))),
              alignment: Alignment.center,
              child: const Text(
                'Photo',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(''),
          ],
        ),
      ),
    );
  }
}
