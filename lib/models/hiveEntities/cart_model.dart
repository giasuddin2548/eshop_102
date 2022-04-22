
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel{
  @HiveField(0)
  String? productId;
  @HiveField(1)
  String? productName;
  @HiveField(2)
  int? productQuantity;
  @HiveField(3)
  double? productPrice;
  @HiveField(4)
  String? productImage;

  CartModel({ this.productId,  this.productName,  this.productQuantity,  this.productPrice,  this.productImage});

}

