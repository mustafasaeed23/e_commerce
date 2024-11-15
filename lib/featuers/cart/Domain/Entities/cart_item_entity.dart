import 'package:e_commerce/featuers/cart/Domain/Entities/cart_product_entity.dart';

class CartItemEntity {
  final int count;
  final String id;
  final int price;
  final CartProductEntity product;

  CartItemEntity(
      {required this.count,
      required this.id,
      required this.price,
      required this.product});
}
