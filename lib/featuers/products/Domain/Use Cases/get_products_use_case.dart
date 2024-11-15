import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/products/Domain/Contract%20Repository/products_contarct_repo.dart';
import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProductsUseCase {
  final ProductsContarctRepo _productsContarctRepo;

  GetProductsUseCase(this._productsContarctRepo);

  Future<Either<Failure, List<ProductEntity>>> call() =>
      _productsContarctRepo.getProducts();
}
