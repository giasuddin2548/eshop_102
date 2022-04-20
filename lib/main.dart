
import 'dart:io';
import 'package:final_project/utils/di.dart';
import 'package:final_project/views/cart_screen.dart';
import 'package:final_project/views/home_screen.dart';
import 'package:final_project/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // home:  HomeScreen(),
      initialBinding: MyDI(),
      builder: EasyLoading.init(),
      smartManagement: SmartManagement.full,
      getPages: [
        GetPage(name: '/', page: ()=>SplashScreen()),
        GetPage(name: HomeScreen.routeName, page: ()=>HomeScreen()),
        GetPage(name: CartScreen.routeName, page: ()=>CartScreen()),
      ],

    );
  }


}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


///https://www.getpostman.com/collections/a98488d30d79fc9fd218

