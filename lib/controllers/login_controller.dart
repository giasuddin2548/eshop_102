
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:final_project/utils/app_constant.dart';
import 'package:final_project/views/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/apis.dart';

class LoginController extends GetxController{

  var userIsLoginIn=false.obs;
  var isLoading=false.obs;
  var loginFormKey=GlobalKey<FormState>();
  TextEditingController userNameController=TextEditingController();
  TextEditingController userPasswordController=TextEditingController();
  var isPasswordShow=false.obs;




  @override
  void onInit() {
    checkUserIsLoginIn();
    super.onInit();
  }

  void checkUserIsLoginIn()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userIsLoginIn.value=prefs.getBool(AppConstant.sharedPIsLogin)??false;
  }



  void userLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio  dio=Dio(BaseOptions(
      baseUrl:'https://6ammart-admin.6amtech.com/',
      headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'zoneId': null,
      'moduleId':'',
      'X-localization': 'en, Authorization: Bearer'
      },
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{

      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
      }else{
        isLoading.value=true;
        var response=await dio.post('api/v1/auth/login?phone=${userNameController.text}&password=${userPasswordController.text}',);
        if(response.statusCode==200){
          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage} Token ${response.data['token']}');
          prefs.setBool(AppConstant.sharedPIsLogin, true);
          prefs.setString(AppConstant.sharedPIsLogin, response.data['token']);
          EasyLoading.showError('Login Success');
          Get.offNamedUntil(HomeScreen.routeName, (route) => false);
        }else{
        }
      }
    }catch(e){
      print('$e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value=false;
    }
  }

  void logout()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void searching() {
    print(userNameController.text);
  }




}