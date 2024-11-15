import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';

abstract class ProductsContarctRepo {
  // Future<Either<List<ProductEntity>, Failure>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
