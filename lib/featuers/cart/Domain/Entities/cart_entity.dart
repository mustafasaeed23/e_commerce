import 'package:e_commerce/featuers/cart/Domain/Entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> products;
  final int totalCartPrice;

  CartEntity({required this.products, required this.totalCartPrice});
}
