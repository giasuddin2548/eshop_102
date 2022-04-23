
import 'package:get/get.dart';
import '../controllers/all_controller.dart';

class MyDI extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegistrationController>(() => RegistrationController());


  }

}