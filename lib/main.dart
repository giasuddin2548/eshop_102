
import 'dart:io';
import 'package:final_project/utils/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/hiveEntities/cart_model.dart';
import 'views/all_screens.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  await Hive.initFlutter();
  Hive.registerAdapter(CartModelAdapter());
  await Hive.openBox<CartModel>('SDFJSDFSD');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop Flutter Mobile App',
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
        GetPage(name: CheckOutScreen.routeName, page: ()=>CheckOutScreen()),
        GetPage(name: LoginScreen.routeName, page: ()=>LoginScreen()),
        GetPage(name: RegistrationScreen.routeName, page: ()=>RegistrationScreen()),

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

