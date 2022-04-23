
import 'package:final_project/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController{
  SharedPreferences sharedPreferences;
  ThemeController(this.sharedPreferences){
    _loadCurrentTheme();
  }
  bool _isDark=false;

  bool get isDark=>_isDark;





  void _loadCurrentTheme() async{
    _isDark=sharedPreferences.getBool(AppConstant.sharedTheme)??false;
    update();
  }


  void changeMyTheme()async{
    _isDark=!_isDark;
    sharedPreferences.setBool(AppConstant.sharedTheme, _isDark);
    update();
  }








}