import 'Data.dart';

class Data {
  Data({
      this.id, 
      this.type, 
      this.typeId, 
      this.image, 
      this.dateAdded, 
      this.data,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    typeId = json['type_id'];
    image = json['image'];
    dateAdded = json['date_added'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? id;
  String? type;
  String? typeId;
  String? image;
  String? dateAdded;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['type_id'] = typeId;
    map['image'] = image;
    map['date_added'] = dateAdded;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}