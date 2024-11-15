import 'package:e_commerce/featuers/cart/Domain/Entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final CartEntity cartEntity;
  GetCartSuccess(this.cartEntity);
}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class AddToCartLoaded extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String message;

  AddToCartError(this.message);
}
