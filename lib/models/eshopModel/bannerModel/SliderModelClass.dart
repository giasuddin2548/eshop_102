import 'Data.dart';

class SliderModelClass {
  SliderModelClass({
      this.error, 
      this.data,});

  SliderModelClass.fromJson(dynamic json) {
    error = json['error'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? error;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}