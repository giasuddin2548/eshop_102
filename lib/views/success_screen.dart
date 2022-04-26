
import 'package:final_project/views/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  static const rountename='/success_screen';
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: TextButton(onPressed: (){
          Get.offNamedUntil(HomeScreen.routeName, (route) => false);
        }, child: const Text('Continue shopping')),
      ),
    );
  }
}
