import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/User_model.dart';

class AuthController{
  static String? accessToken;
  static UserModel? userModel;

  static const String _accessTokenKey='access-token';
  static const String _userDataKey='user-data';
  
  static Future<void> saveUserDta(String token,UserModel model) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    accessToken=token;
    userModel=model;
  }

  static Future<void> getUserData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token=sharedPreferences.getString(_accessTokenKey);
    String? useerdata=sharedPreferences.getString(_userDataKey);
    accessToken=token;
    userModel=UserModel.fromJson(jsonDecode(useerdata!));
  }

   static Future<bool> isUserLoggedIn() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String? token=sharedPreferences.getString(_accessTokenKey);
    if(token != null){
      await getUserData();
      return true;
    }
    return false;
   }

   static Future<void> clearUserdata() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.clear();
   }


}