import 'package:e_commerce/featuers/cart/Data/Models/get_cart_response/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);
  Future<CartResponse> getCart();
  Future<CartResponse> updateToCart(String productId, int count);
  Future<CartResponse> deleteFromCart(String productId);
}
