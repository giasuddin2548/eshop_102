class Store {
  Store({
      this.id, 
      this.name, 
      this.phone, 
      this.email, 
      this.logo, 
      this.latitude, 
      this.longitude, 
      this.address, 
      this.footerText, 
      this.minimumOrder, 
      this.comission, 
      this.scheduleOrder, 
      this.status, 
      this.vendorId, 
      this.createdAt, 
      this.updatedAt, 
      this.freeDelivery, 
      this.coverPhoto, 
      this.delivery, 
      this.takeAway, 
      this.itemSection, 
      this.tax, 
      this.zoneId, 
      this.reviewsSection, 
      this.active, 
      this.offDay, 
      this.selfDeliverySystem, 
      this.posSystem, 
      this.deliveryCharge, 
      this.deliveryTime, 
      this.veg, 
      this.nonVeg, 
      this.orderCount, 
      this.totalOrder, 
      this.moduleId, 
      this.orderPlaceToScheduleInterval, 
      this.featured, 
      this.avgRating, 
      this.ratingCount, 
      this.gstStatus, 
      this.gstCode,});

  Store.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    itemSection = json['item_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    deliveryCharge = json['delivery_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    moduleId = json['module_id'];
    orderPlaceToScheduleInterval = json['order_place_to_schedule_interval'];
    featured = json['featured'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count '];
    gstStatus = json['gst_status'];
    gstCode = json['gst_code'];
  }
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  dynamic footerText;
  int? minimumOrder;
  dynamic comission;
  bool? scheduleOrder;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? itemSection;
  int? tax;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? deliveryCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  int? moduleId;
  int? orderPlaceToScheduleInterval;
  int? featured;
  int? avgRating;
  int? ratingCount;
  bool? gstStatus;
  String? gstCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['logo'] = logo;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['address'] = address;
    map['footer_text'] = footerText;
    map['minimum_order'] = minimumOrder;
    map['comission'] = comission;
    map['schedule_order'] = scheduleOrder;
    map['status'] = status;
    map['vendor_id'] = vendorId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['free_delivery'] = freeDelivery;
    map['cover_photo'] = coverPhoto;
    map['delivery'] = delivery;
    map['take_away'] = takeAway;
    map['item_section'] = itemSection;
    map['tax'] = tax;
    map['zone_id'] = zoneId;
    map['reviews_section'] = reviewsSection;
    map['active'] = active;
    map['off_day'] = offDay;
    map['self_delivery_system'] = selfDeliverySystem;
    map['pos_system'] = posSystem;
    map['delivery_charge'] = deliveryCharge;
    map['delivery_time'] = deliveryTime;
    map['veg'] = veg;
    map['non_veg'] = nonVeg;
    map['order_count'] = orderCount;
    map['total_order'] = totalOrder;
    map['module_id'] = moduleId;
    map['order_place_to_schedule_interval'] = orderPlaceToScheduleInterval;
    map['featured'] = featured;
    map['avg_rating'] = avgRating;
    map['rating_count '] = ratingCount;
    map['gst_status'] = gstStatus;
    map['gst_code'] = gstCode;
    return map;
  }

}