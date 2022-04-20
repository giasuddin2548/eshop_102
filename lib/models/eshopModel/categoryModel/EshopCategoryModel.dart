import 'Data.dart';
import 'PopularCategories.dart';

class EshopCategoryModel {
  EshopCategoryModel({
      this.message, 
      this.error, 
      this.total, 
      this.data, 
      this.popularCategories,});

  EshopCategoryModel.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    if (json['popular_categories'] != null) {
      popularCategories = [];
      json['popular_categories'].forEach((v) {
        popularCategories?.add(PopularCategories.fromJson(v));
      });
    }
  }
  String? message;
  bool? error;
  int? total;
  List<Data>? data;
  List<PopularCategories>? popularCategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (popularCategories != null) {
      map['popular_categories'] = popularCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}