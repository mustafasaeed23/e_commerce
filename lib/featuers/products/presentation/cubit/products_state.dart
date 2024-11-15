import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<ProductEntity> productsList;
  ProductsSuccessState(this.productsList);
}

class ProductsFailureState extends ProductsState {
  final String message;
  ProductsFailureState(this.message);
}
