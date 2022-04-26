import 'package:final_project/controllers/registration_controller.dart';
import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:final_project/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class RegistrationScreen extends StatelessWidget {
  static const String routeName='/registration_screen';

  final RegistrationController _controller=Get.put(RegistrationController());


  double h=0.0;
  double w=0.0;


  @override
  Widget build(BuildContext context) {
    w=Get.size.width;
    h=Get.size.height;
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child: Text("Registration Screen")),
      ),
      backgroundColor: Colors.grey.withOpacity(0.3),
      body: Container(
        // margin: const EdgeInsets.only(top: 200, bottom: 200, left: 20, right: 20),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Form(
          key: _controller.loginFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  // color: Colors.amber,
                  height: 70,
                  child: Center(child: Text('Registration Form', style: TextStyle(fontSize: 18),)),
                ),
                const Divider(height: 1,),

                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20 ),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    cursorColor: AppConstant.mySecondaryColor(),
                    controller: _controller.firstNameController,

                    decoration: InputDecoration(

                      errorStyle: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,

                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'First Name',
                      labelStyle: const TextStyle(fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.myMainColor(), width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.mySecondaryColor(), width: 1.0 ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outlined,color: AppConstant.mySecondaryColor(),size: 18,),
                      contentPadding: const EdgeInsets.only(top: 0, left: 25),
                      label: Text('First Name', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),

                    ),

                    validator: (v){
                      if (v!.isEmpty) {
                        return "First Name is Required.";
                      }
                      return null;

                    },
                  ),
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20 ),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    cursorColor: AppConstant.mySecondaryColor(),
                    controller: _controller.lastNameController,

                    decoration: InputDecoration(

                      errorStyle: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,

                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Last Name',
                      labelStyle: const TextStyle(fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.myMainColor(), width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.mySecondaryColor(), width: 1.0 ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_outlined,color: AppConstant.mySecondaryColor(),size: 18,),
                      contentPadding: const EdgeInsets.only(top: 0, left: 25),
                      label: Text('Last Name', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),

                    ),

                    validator: (v){
                      if (v!.isEmpty) {
                        return "Last Name is Required.";
                      }
                      return null;

                    },
                  ),
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20 ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 14),
                    cursorColor: AppConstant.mySecondaryColor(),
                    controller: _controller.mobileNoController,

                    decoration: InputDecoration(

                      errorStyle: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,

                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: '+8801',
                      labelStyle: const TextStyle(fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.myMainColor(), width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.mySecondaryColor(), width: 1.0 ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.call,color: AppConstant.mySecondaryColor(),size: 18,),
                      contentPadding: const EdgeInsets.only(top: 0, left: 25),
                      label: Text('Mobile No.', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
                      // suffixIcon: IconButton(
                      //   icon: Icon(!_controller.isPasswordShow.value?Icons.visibility_off:Icons.visibility, size: 18, color:AppConstant.mySecondaryColor() ,),
                      //   onPressed: () {
                      //     _controller.isPasswordShow.value = !_controller.isPasswordShow.value;
                      //   },
                      // ),

                    ),




                    validator: (v){
                      if (v!.isEmpty) {
                        return "Mobile is required.";
                      }
                      return null;

                    },
                  ),
                ),
                Container(
                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20 ),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    cursorColor: AppConstant.mySecondaryColor(),
                    controller: _controller.emailController,

                    decoration: InputDecoration(

                      errorStyle: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,

                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                      labelStyle: const TextStyle(fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.myMainColor(), width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.mySecondaryColor(), width: 1.0 ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined,color: AppConstant.mySecondaryColor(),size: 18,),
                      contentPadding: const EdgeInsets.only(top: 0, left: 25),
                      label: Text('Email', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),

                    ),

                    validator: (v){
                      if (v!.isEmpty) {
                        return "Email is Required.";
                      }
                      return null;

                    },
                  ),
                ),
                Container(

                  height: 70,
                  margin: const EdgeInsets.only(left: 20, right: 20 ),
                  child: Obx(()=>TextFormField(
                    obscureText: !_controller.isPasswordShow.value,

                    style: const TextStyle(fontSize: 14),
                    cursorColor: AppConstant.mySecondaryColor(),
                    controller: _controller.userPasswordController,

                    decoration: InputDecoration(

                      errorStyle: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,

                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),

                      focusedErrorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                      labelStyle: const TextStyle(fontSize: 14),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.myMainColor(), width: 1.0),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppConstant.mySecondaryColor(), width: 1.0 ),
                          borderRadius: const BorderRadius.all(Radius.circular(10))
                      ),
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outlined,color: AppConstant.mySecondaryColor(),size: 18,),
                      contentPadding: const EdgeInsets.only(top: 0, left: 25),
                      label: Text('Password', style: TextStyle(color: AppConstant.mySecondaryColor(), fontSize: 15),),
                      suffixIcon: IconButton(
                        icon: Icon(!_controller.isPasswordShow.value?Icons.visibility_off:Icons.visibility, size: 18, color:AppConstant.mySecondaryColor() ,),
                        onPressed: () {
                          _controller.isPasswordShow.value = !_controller.isPasswordShow.value;
                        },
                      ),

                    ),

                    validator: (v){
                      if (v!.isEmpty) {
                        return "Password is required.";
                      }

                      return null;
                    },
                  )),
                ),
                SizedBox(
                  // color: Colors.blue,
                  height: 70,
                  child: TextButton.icon(onPressed: (){

                    if(_controller.loginFormKey.currentState!.validate()){
                      _controller.userRegistration();
                    }

                  }, icon: const Icon(Icons.login), label: const Text('Registration')),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}




