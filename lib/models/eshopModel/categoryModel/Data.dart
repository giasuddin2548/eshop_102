
import 'State.dart';

class Data {
  Data({
      this.id, 
      this.name, 
      this.parentId, 
      this.slug, 
      this.image, 
      this.banner, 
      this.rowOrder, 
      this.status, 
      this.clicks, 
      // this.children,
      this.text, 
      this.state, 
      this.icon, 
      this.level, 
      this.total,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parent_id'];
    slug = json['slug'];
    image = json['image'];
    banner = json['banner'];
    rowOrder = json['row_order'];
    status = json['status'];
    clicks = json['clicks'];
    // if (json['children'] != null) {
    //   children = [];
    //   json['children'].forEach((v) {
    //     children?.add(Children.fromJson(v));
    //   });
    // }
    text = json['text'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
    icon = json['icon'];
    level = json['level'];
    total = json['total'];
  }
  String? id;

  String? name;
  String? parentId;
  String? slug;
  String? image;
  String? banner;
  String? rowOrder;
  String? status;
  String? clicks;
  // List<Children>? children;
  String? text;
  State? state;
  String? icon;
  int? level;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['parent_id'] = parentId;
    map['slug'] = slug;
    map['image'] = image;
    map['banner'] = banner;
    map['row_order'] = rowOrder;
    map['status'] = status;
    map['clicks'] = clicks;
    // if (children != null) {
    //   map['children'] = children?.map((v) => v.toJson()).toList();
    // }
    map['text'] = text;
    if (state != null) {
      map['state'] = state?.toJson();
    }
    map['icon'] = icon;
    map['level'] = level;
    map['total'] = total;
    return map;
  }

}