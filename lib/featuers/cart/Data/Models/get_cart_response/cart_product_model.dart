import 'package:e_commerce/featuers/cart/Domain/Entities/cart_product_entity.dart';

class CartProductModel extends CartProductEntity {
  CartProductModel(
      {required super.id,
      required super.title,
      required super.imageCover,
      required super.ratingsAverage});

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      imageCover: json['imageCover'] as String,
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}
