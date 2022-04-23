class CategoryModel {
  CategoryModel({
      this.id, 
      this.name, 
      this.image, 
      this.parentId, 
      this.position, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.priority, 
      this.moduleId,});

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    parentId = json['parent_id'];
    position = json['position'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    priority = json['priority'];
    moduleId = json['module_id'];
  }
  int? id;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  int? moduleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['parent_id'] = parentId;
    map['position'] = position;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['priority'] = priority;
    map['module_id'] = moduleId;
    return map;
  }

}