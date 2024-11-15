import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/cart/Domain/Entities/cart_entity.dart';

abstract class CartContractRepo {
  Future<Either<Failure, CartEntity>> getUserCart();
  Future<Either<Failure, void>> addToCart(String productId);
  Future updateCart(String productId, int count);
  Future deleteFromCart(String productId);
}
