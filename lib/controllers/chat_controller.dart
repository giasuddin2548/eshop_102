
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/chat/BrandList.dart';
import '../models/chat/ChatModel.dart';
import '../models/promo_model.dart';
import '../utils/apis.dart';


class ChatController extends GetxController{

  late Timer _timer;

  RxObjectMixin<ChatModel> chatModel=ChatModel().obs;



  @override
  void onInit() {
    _getChatData();
    super.onInit();
  }
  // void getChatting()async {
  //   _timer=Timer.periodic(const Duration(seconds: 3), (timer) async{
  //    await _getChatData();
  //   });
  // }



  Future<void> _getChatData() async{
    Dio  dio=Dio();

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{

      if (connectivityResult == ConnectivityResult.none) {
        // EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
      }else{
        // isLoading.value=true;
        //var response=await dio.post('api/v1/auth/login?phone=${mobileNoController.text}&password=${userPasswordController.text}',);
        var response=await dio.get('https://mobile.mobilestorebd.com/api.php?brand_list');
        if(response.statusCode==200){

         var data =response.data['brand_list'] as List;

          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage} Token ${response.data['token']}');

          var list=data.map((e) => BrandList.fromJson(e)).toList();
          print('DATA:${list.length}');
        }else{
        }
      }
    }catch(e){
      // print('$e');
      // EasyLoading.showError('Failed to Load data');
    }finally{
      // isLoading.value=false;
    }
  }





}