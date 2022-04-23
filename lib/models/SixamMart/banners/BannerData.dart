import 'Banners.dart';

class BannerData {
  BannerData({
      // this.campaigns,
      this.banners,});

  BannerData.fromJson(dynamic json) {
    // if (json['campaigns'] != null) {
    //   campaigns = [];
    //   json['campaigns'].forEach((v) {
    //     campaigns?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(Banners.fromJson(v));
      });
    }
  }
  // List<dynamic>? campaigns;
  List<Banners>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // if (campaigns != null) {
    //   map['campaigns'] = campaigns?.map((v) => v.toJson()).toList();
    // }
    if (banners != null) {
      map['banners'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}