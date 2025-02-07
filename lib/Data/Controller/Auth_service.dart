import 'package:get/get.dart';

class AuthService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://task.teamrabbil.com/api/v1';
  }

  Future<Response> signUpUser(Map<String, dynamic> data) async {
    try {
      Response response = await post('/registration', data);
      return response;
    } catch (e) {
      return Response(statusCode: 500, body: {'message': 'Server error'});
    }
  }
}
