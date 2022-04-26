import 'BrandList.dart';

class ChatModel {
  ChatModel({
      this.brandList,});

  ChatModel.fromJson(dynamic json) {
    if (json['brand_list'] != null) {
      brandList = [];
      json['brand_list'].forEach((v) {
        brandList?.add(BrandList.fromJson(v));
      });
    }
  }
  List<BrandList>? brandList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (brandList != null) {
      map['brand_list'] = brandList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}