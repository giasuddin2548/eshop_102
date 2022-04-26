import 'Store.dart';

class Banners {
  Banners({
      this.id, 
      this.title, 
      this.type, 
      this.image, 
      this.store, 
      this.item,});

  Banners.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    image = json['image'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    item = json['item'];
  }
  int? id;
  String? title;
  String? type;
  String? image;
  Store? store;
  dynamic item;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['type'] = type;
    map['image'] = image;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    map['item'] = item;
    return map;
  }

}