
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class FailedScreen extends StatelessWidget {
  static const rountename='/failed_screen';
  const FailedScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Failed'),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          Get.offNamedUntil(HomeScreen.routeName, (route) => false);
        }, child: const Text('Try Again')),
      ),
    );
  }
}
