
import 'package:get/get.dart';

import '../controllers/home_screen_controller.dart';


class MyDI extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }

}