import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';

//ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  static const String routeName='/registration_screen';

  //CartController controller=Get.put(CartController());


  double h=0.0;
  double w=0.0;


  @override
  Widget build(BuildContext context) {
    w=Get.size.width;
    h=Get.size.height;
    return Scaffold(
      body: Container(),
    );
  }
}



