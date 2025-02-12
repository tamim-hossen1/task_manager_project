import 'package:get/get.dart';
import 'package:task_manager_project/Data/Controller/Auth_Controller.dart';
import 'package:task_manager_project/Data/utils/Urls.dart';

class AuthService extends GetConnect {

  // static const String _baseUrl='https://task.teamrabbil.com/api/v1';

  // AuthService() {
  //   httpClient.baseUrl =Urls.;
  // }

  Future<Response> signUpUser(Map<String, dynamic> userdata) async {
     final Response response = await post(Urls.registrationUrl, userdata,
    headers: {
      'content-type': 'application/json'
    }
    );
    if (response.isOk && response.body['token'] !=null) {
      String token=response.body['token'];
      // await AuthController.saveUserToken(token);
    }
    return response;
  }

  Future<Response> signIn(Map<String,dynamic> userdata) async{
    final Response response=await post(Urls.loginUrl, userdata,
    headers: {
      'content-type': 'application/json'
    },

    );
    if(response.isOk && response.body['token'] != null){
      String token=response.body['token'];

    }
    return response;
  }
}
