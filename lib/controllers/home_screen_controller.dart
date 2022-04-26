
import 'package:final_project/models/SixamMart/popularProduct/PopularProductModel.dart';
import 'package:final_project/models/user.dart';
import 'package:final_project/utils/apis.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../models/JsonHolderData.dart';
import '../models/SixamMart/banners/BannerData.dart';
import '../models/SixamMart/cat/CategoryModel.dart';
import '../models/eshopModel/bannerModel/SliderModelClass.dart';
import '../models/eshopModel/categoryModel/EshopCategoryModel.dart';
import '../models/picsumModel/PicSumModel.dart';



class HomeScreenController extends GetxController{

  var myValue=0.obs;
  var appBarName='Home Screen'.obs;
  var cgpa=0.0.obs;
  var myUserList=[].obs;
  var myMap={}.obs;
  var isActive=false.obs;
  List<String> myList=[];
  var name=<String>['s'].obs;
  var number=<int>[1].obs;
  var userModel=<UserModel>[].obs;

  var totalCartItem=0.obs;


  var postList=<JsonHolderData>[].obs;
  var picSumDataList=<PicSumModel>[].obs;
  var categoryList=<CategoryModel>[].obs;
  var popularProductList=<PopularProductModel>[].obs;

  RxObjectMixin<EshopCategoryModel> myEshopCategoryData=EshopCategoryModel().obs;
  RxObjectMixin<SliderModelClass> mySliderData=SliderModelClass().obs;

  var isLoading=false.obs;
  var sliderCurrentPosition=0.obs;
  RxObjectMixin<BannerData> bannerData=BannerData().obs;



  @override
  void onInit() {
    print('OnInit Method Called');
    cgpa.value=3.5;
    // _fetchPostData();
    // _postDataToJsonHolder();
    // _fetchPostData1();
    // _putDataToJsonHolder();
    // _patchDataToJsonHolder();
    // _deleteDataToJsonHolder();

    // getPaginationData( pageNo: 3);
    // getEshopCategories();
    getEshopBanner();
    getCategories();
    getPopularProducts();
    super.onInit();
  }

  @override
  void onClose() {
    print('onClose Method Called');
    cgpa.close();
    super.onClose();
  }




  void increment(){
    myValue.value++;
    myUserList.add('Item-${myValue.value}');
  }


  void removeItem(int index){
    myUserList.removeAt(index);
  }

  void updateItem(int i) {
    myUserList[i]='Samir';
  }


  void getEshopBanner() async{

    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
      headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'zoneId': '1',
      'moduleId': '1',
      'X-localization': 'en',
      'Authorization': 'Bearer null'

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
        EasyLoading.show(status: 'loading...');

        var response=await dio.get(Apis.getBannerData);

        if(response.statusCode==200){

          var myReceivedData=response.data;
          isLoading.value=false;


         // EasyLoading.showToast('Data Loading Success', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          bannerData.value=BannerData.fromJson(myReceivedData);


        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value=false;
      EasyLoading.dismiss();

    }
  }
  void getCategories() async{

    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'zoneId': '1',
        'moduleId': '1',
        'X-localization': 'en',
        'Authorization': 'Bearer null'



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
        EasyLoading.show(status: 'loading...');

        var response=await dio.get(Apis.getCategory);

        if(response.statusCode==200){

          var myReceivedData=response.data as List;
          isLoading.value=false;
          print('sdfsdfdsf ${response.statusCode}');

          // EasyLoading.showToast('Data Loading Success', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          categoryList.value=myReceivedData.map((e) => CategoryModel.fromJson(e)).toList();
          print('sdfsdfdsf ${categoryList.length}');




        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value=false;
      EasyLoading.dismiss();

    }
  }
  void getPopularProducts() async{

    Dio  dio=Dio(BaseOptions(
      baseUrl:Apis.baseUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'zoneId': '1',
        'moduleId': '1',
        'X-localization': 'en',
        'Authorization': 'Bearer null'



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
        EasyLoading.show(status: 'loading...');

        var response=await dio.get(Apis.getPopularProduct);

        if(response.statusCode==200){

          var myReceivedData=response.data as List;
          isLoading.value=false;
          print('sdfsdfdsf ${response.statusCode}');

          // EasyLoading.showToast('Data Loading Success', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
          popularProductList.value=myReceivedData.map((e) => PopularProductModel.fromJson(e)).toList();
          //print('shahin ${popularProductList.length}');




        }else{
          print('Failed to load data');
        }
      }
    }catch(e){
      print('Error occurred: $e');
      EasyLoading.showError('Failed to Load data');
    }finally{
      isLoading.value=false;
      EasyLoading.dismiss();

    }
  }


  // void getEshopCategories() async{
  //
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrlEshop,
  //     headers: {
  //       'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjIwMDE3OTAyMDUsImlhdCI6MTY0MTc5MDIwNSwiaXNzIjoiZXNob3AifQ.pMhVWFe_ql39Pdt4jh0D3v-_cQsO0XgqDUVlUSwEb6E'
  //     },
  //   ));
  //
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //
  //       isLoading.value=true;
  //       print('Internet Connected');
  //       // EasyLoading.show(status: 'loading...');
  //
  //       var response=await dio.post(Apis.eshopCategories);
  //
  //       if(response.statusCode==200){
  //
  //         var myReceivedData=response.data;
  //
  //         // EasyLoading.showSuccess('Great Success!');
  //         EasyLoading.showToast(myReceivedData['message'], duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         myEshopCategoryData.value=EshopCategoryModel.fromJson(myReceivedData);
  //
  //         print('My Popular Data List length from Model ${myEshopCategoryData.value.popularCategories?.length??0}');
  //
  //
  //
  //
  //
  //
  //
  //
  //
  //         // var myPopularData=myReceivedData['popular_categories'] as List;
  //         // var myDataList=myReceivedData['data'] as List;
  //         //
  //         // print('My Popular Data List length ${myPopularData.length}');
  //         // print('My Popular Data List length ${myDataList.length}');
  //
  //
  //         // var myPostData=response.data as List;
  //         //
  //         // var newList=myPostData.map((e) => PicSumModel.fromJson(e)).toList();
  //         //
  //         // picSumDataList.clear();
  //         // picSumDataList.addAll(newList);
  //         //
  //         // print('dfdsf ${picSumDataList.length}');
  //
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     isLoading.value=false;
  //     // EasyLoading.dismiss();
  //
  //   }
  // }




  // Future<void> _fetchPostData() async{
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrl,
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.get(Apis.getJsonHolderPostData);
  //       if(response.statusCode==200){
  //         // EasyLoading.showSuccess('Great Success!');
  //         EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data as List;
  //
  //         var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
  //
  //         postList.addAll(newList);
  //
  //         print('dfdsf ${postList.length}');
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }
  //
  // Future<void> _postDataToJsonHolder() async{
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrl,
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.post(Apis.getJsonHolderPostData, data: {
  //         'userId':'10',
  //         'title':'my title',
  //         'body':'My body'
  //       });
  //
  //       if(response.statusCode==201){
  //         // EasyLoading.showSuccess('Great Success!');
  //
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data;
  //
  //         EasyLoading.showToast('Data loaded successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //
  //         //
  //         // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
  //         //
  //         // postList.addAll(newList);
  //         //
  //         // print('dfdsf ${postList.length}');
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }
  //
  // Future<void> _putDataToJsonHolder() async{
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrl,
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.put(Apis.getJsonHolderPostDataByPostId+'50', data: {
  //         'userId':'10',
  //         'title':'my title',
  //         'body':'My body'
  //       });
  //
  //       if(response.statusCode==200){
  //         // EasyLoading.showSuccess('Great Success!');
  //
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data;
  //
  //         EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //
  //         //
  //         // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
  //         //
  //         // postList.addAll(newList);
  //         //
  //         // print('dfdsf ${postList.length}');
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }
  //
  // Future<void> _patchDataToJsonHolder() async{
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrl,
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.patch(Apis.getJsonHolderPostDataByPostId+'50', data: {
  //         'userId':'10',
  //         'title':'my title',
  //         'body':'My body'
  //       });
  //
  //       if(response.statusCode==200){
  //         // EasyLoading.showSuccess('Great Success!');
  //
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data;
  //
  //         EasyLoading.showToast('Updated successfully at:\n${myPostData['id']}', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //
  //         //
  //         // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
  //         //
  //         // postList.addAll(newList);
  //         //
  //         // print('dfdsf ${postList.length}');
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }
  //
  // Future<void> _deleteDataToJsonHolder() async{
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:Apis.baseUrl,
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.delete(Apis.getJsonHolderPostDataByPostId+'19');
  //
  //       if(response.statusCode==200){
  //         // EasyLoading.showSuccess('Great Success!');
  //
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data;
  //
  //         EasyLoading.showToast('Record deleted successfully ', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //
  //         //
  //         // var newList=myPostData.map((e) => JsonHolderData.fromJson(e)).toList();
  //         //
  //         // postList.addAll(newList);
  //         //
  //         // print('dfdsf ${postList.length}');
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }
  //
  // void getPaginationData({required int pageNo}) async{
  //
  //   var url='https://picsum.photos/v2/list?page=3&limit=5';
  //
  //
  //   Dio  dio=Dio(BaseOptions(
  //     baseUrl:'https://picsum.photos',
  //   ));
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   try{
  //     if (connectivityResult == ConnectivityResult.none) {
  //       EasyLoading.showToast('No Internet Connection', duration: const Duration(seconds: 2));
  //
  //       print('No Internet Connection');
  //     }else{
  //       print('Internet Connected');
  //       EasyLoading.show(status: 'loading...');
  //       var response=await dio.get('/v2/list', queryParameters:{
  //           'page':'$pageNo',
  //           'limit':'5'
  //       } );
  //       if(response.statusCode==200){
  //         // EasyLoading.showSuccess('Great Success!');
  //         EasyLoading.showToast('Data loaded successfully', duration: const Duration(seconds: 2), toastPosition:EasyLoadingToastPosition.bottom );
  //         print('HTTP Mehtod: ${response.requestOptions.method} ');
  //         print('HTTP URL: ${response.requestOptions.baseUrl} ');
  //         print('HTTP Path: ${response.requestOptions.path} ');
  //         print('HTTP Status code: ${response.statusCode} Status Message: ${response.statusMessage}');
  //
  //         var myPostData=response.data as List;
  //
  //         var newList=myPostData.map((e) => PicSumModel.fromJson(e)).toList();
  //
  //         picSumDataList.clear();
  //         picSumDataList.addAll(newList);
  //
  //         print('dfdsf ${picSumDataList.length}');
  //
  //
  //
  //       }else{
  //         print('Failed to load data');
  //       }
  //     }
  //   }catch(e){
  //     print('Error occurred: $e');
  //     EasyLoading.showError('Failed to Load data');
  //   }finally{
  //     EasyLoading.dismiss();
  //
  //   }
  // }








}