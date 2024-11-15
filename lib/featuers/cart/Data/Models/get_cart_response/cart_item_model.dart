import 'package:e_commerce/featuers/cart/Data/Models/get_cart_response/cart_product_model.dart';
import 'package:e_commerce/featuers/cart/Domain/Entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel(
      {required super.count,
      required super.id,
      required super.price,
      required super.product});

  @override
  String toString() {
    return 'Product(count: $count, id: $id, product: $product, price: $price)';
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      count: json['count'] as int,
      id: json['_id'] as String,
      product:
          CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
      price: json['price'] as int,
    );
  }
}
