import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_project/widgets/Screen_Background.dart';
import 'package:task_manager_project/widgets/tm_appBar.dart';

import '../../Data/Controller/Auth_Controller_Get.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  static const String name='/new-task-list-screen';

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
final AuthControllerGet  _authControllerGet=Get.put(AuthControllerGet());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppbar(),
      body: ScreenBackground(
        child: Obx((){
          if(_authControllerGet.isLoadding.value){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(_authControllerGet.postList.isEmpty){
            return const Center(
              child: Text('No data Available'),
            );
          }
          return ListView.builder(
            itemCount: _authControllerGet.postList.length,
              itemBuilder: (context,index){
              final post=_authControllerGet.postList[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(post.title ?? 'No Titile'),subtitle: Row(
                  children: [
                    Text(post.description ?? 'No description'),
                    Text(post.createdDate ?? 'No creation Date'),
                  ],
                ),
                  leading: Row(
                    children: [
                      Text(post.status ?? 'None'),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon:Icon(Icons.delete)
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.check)
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
              }
          );
        }
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){

        },
        child: Icon(Icons.add),
      ),
    );
  }
}


