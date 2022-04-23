
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:final_project/models/hiveEntities/cart_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../models/promo_model.dart';
import '../utils/apis.dart';


class CartController extends GetxController{

  var cartData=<CartModel>[].obs;
  var promoList=<PromoModel>[].obs;
  var selectedPromoPrice=''.obs;
  var selectedPromoName='Add promo'.obs;

  var totalCartPrice=0.0.obs;
  var shppingCost=0.0.obs;
  var grandTotal=0.0.obs;
  var payableAmount=0.0.obs;

  var isLoading=false.obs;

  @override
  void onInit() {
    shppingCost.value=50;
    super.onInit();
  }


  void getCartData()async{
    var box =await  Hive.openBox<CartModel>('SDFJSDFSD');
    cartData.clear();
    cartData.value=box.values.cast<CartModel>().toList();
    calculateTotalCart();
  }

  void insertCartData(CartModel cartModel)async{
    var box =await  Hive.openBox<CartModel>('SDFJSDFSD');
    await box.add(cartModel);
    getCartData();
  }

  void allClearCartData()async{
    var box =await  Hive.openBox<CartModel>('SDFJSDFSD');
    await box.clear();
    getCartData();
  }

  void deleteDataByIndex(int index)async{
    var box =await  Hive.openBox<CartModel>('SDFJSDFSD');
    await box.deleteAt(index);
    getCartData();
  }

  void updateCartItemByIndex(int index, CartModel cartModel)async{
    var box =await  Hive.openBox<CartModel>('SDFJSDFSD');
    await box.putAt(index, cartModel);
    getCartData();
  }

  String calculateTotal(int? productQuantity, double? productPrice) {
    var q=productQuantity?.toDouble()??1.0;
    var p=productPrice??1.0;
    return '${p*q}';
  }

  void calculateTotalCart(){
    try{
      var count=0.0;

      for (var element in cartData) {
        count=count+double.parse(calculateTotal(element.productQuantity, element.productPrice));

        // print(calculateItemTotalPrice(element.price, element.quantity));
      }


      totalCartPrice.value=count;
      grandTotal.value=shppingCost.value+totalCartPrice.value;
      selectedPromoPrice.value='0.0';
      selectedPromoName.value='Add Promo';
      payableAmount.value=shppingCost.value+totalCartPrice.value;


    }catch(e, l){
      print('Total Calculate: $e');
      print('Total Calculate Line: $l');
    }


  }



  void getPromoCodes() async{

    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrlEshop,
      headers: {
        'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjIwMDE3OTAyMDUsImlhdCI6MTY0MTc5MDIwNSwiaXNzIjoiZXNob3AifQ.pMhVWFe_ql39Pdt4jh0D3v-_cQsO0XgqDUVlUSwEb6E'
      },
    ));

    var connectivityResult = await (Connectivity().checkConnectivity());
    try{

      if (connectivityResult == ConnectivityResult.none) {
        EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));

        print('No Internet Connection');
      }else{

        isLoading.value=true;
        print('Internet Connected');
        // EasyLoading.show(status: 'loading...');

        var response=await dio.post(Apis.eshopSlider);

        if(response.statusCode==200){

          print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
          promoList.clear();
          promoList.add(PromoModel(promoCode: 'Eid2022', promoId: '1', promoImage: 'https://static.vecteezy.com/system/resources/previews/002/453/533/large_2x/big-sale-discount-banner-template-promotion-illustration-free-vector.jpg', promoPrice: '15.0'));
          promoList.add(PromoModel(promoCode: 'Eid2023', promoId: '2', promoImage: 'https://static.vecteezy.com/system/resources/previews/002/822/446/non_2x/sale-banner-template-design-big-sale-special-offer-promotion-discount-banner-vector.jpg', promoPrice: '20.0'));
          promoList.add(PromoModel(promoCode: 'Eid2024', promoId: '3', promoImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOfJK4mPq6KfvKv-pTZoFDz87E0r4JhftzvbnCbdq0mpJDQZA6RcFCb7go-nnXY1Gqg4w&usqp=CAU', promoPrice: '10.0'));



        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value=false;
      // EasyLoading.dismiss();

    }
  }










}