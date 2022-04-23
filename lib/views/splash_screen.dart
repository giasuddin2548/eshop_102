

import 'package:final_project/views/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    goHomeScreen(context);

    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children:  [

          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/eshop_logo.png'),

            ),
          ),
          Container(
            height: 10,
          ),
          const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          )

        ],
      ),

    );
  }

  void goHomeScreen(BuildContext context) async{

    // Navigator.pushReplacementNamed(context, '/home_screen');
    // Navigator.pushReplacementNamed(context, HomeScreen.routeName);

    await Future.delayed(const Duration(seconds: 5));
    // Get.toNamed(HomeScreen.routeName);
    // Get.offAll(HomeScreen.routeName);
    Get.offNamedUntil(HomeScreen.routeName, (route) => false);




  }





}
