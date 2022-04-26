import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/cart_controller.dart';
import 'package:final_project/views/failed_screen.dart';
import 'package:final_project/views/success_screen.dart';


//ignore: must_be_immutable
class CheckOutScreen extends StatefulWidget {
  static const String routeName='/check_out_screen';

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  //CartController controller=Get.put(CartController());
  double h=0.0;
  double w=0.0;

  var currentUrl ='';
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  late WebViewController  controllerGlobal;
  var baseUrl = 'https://dummypay.publicdemo.xyz';
  // var baseUrl2 = 'https://www.prothomalo.com/';
  bool isLoading = true;
  // baseUrl = '$baseUrl/payment-mobile?customer_id=100&order_id=110$amount=200';

  @override
  void initState() {

    if(Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop:()=>_exitApp(context),
          child:Stack(
            children: [
              WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: baseUrl,


                userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
                gestureNavigationEnabled: true,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.future.then((value) => controllerGlobal = value);
                  _controller.complete(webViewController);
                },


                onPageStarted: (String url) {

                  print('Page started loading: $url');


                  setState(() {
                    isLoading = true;
                  });


                  bool _isSuccess = url.contains('success') && url.contains(baseUrl);
                  bool _isFailed = url.contains('fail') && url.contains(baseUrl);
                  bool _isCancel = url.contains('cancel') && url.contains(baseUrl);


                  if(_isSuccess){
                    showSnackBar('Payment Success');
                    Get.put(CartController()).allClearCartData();
                    // Get.offAll(HomeScreen.routeName);
                    Get.offNamedUntil(SuccessScreen.rountename, (route) => false);
                    // Navigator.pushReplacementNamed(context, '');
                  }else if(_isFailed) {
                    showSnackBar('Payment Failed');
                    // Get.offAll(HomeScreen.routeName);
                    Get.offNamedUntil(FailedScreen.rountename, (route) => false);
                    // Navigator.pushReplacementNamed(context, '');
                  }else if(_isCancel) {
                    showSnackBar('Payment Canceled');
                    // Get.offAll(HomeScreen.routeName);
                    Get.offNamedUntil(FailedScreen.rountename, (route) => false);
                    // Navigator.pushReplacementNamed(context, '');
                  }



                },




                onPageFinished: (String url) {

                  print('Page finished loading: $url');


                  setState(() {
                    isLoading = false;
                  });
                },



              ),


              isLoading ? Center(
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
              ) : const SizedBox.shrink(),
            ],
          ),


        ),
      ),
    );
  }

  void showSnackBar(String msg){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),));
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await controllerGlobal.canGoBack()) {
      controllerGlobal.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

}


