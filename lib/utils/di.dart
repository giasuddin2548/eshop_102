
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/all_controller.dart';


Future<void> init(SharedPreferences sharedPreferences)async{

  Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  Get.lazyPut<CartController>(() => CartController());
  Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<ThemeController>(() => ThemeController(sharedPreferences));
  Get.lazyPut<RegistrationController>(() => RegistrationController());

}