import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/products/Data/Data%20Source/products_remote_data_source.dart';
import 'package:e_commerce/featuers/products/Domain/Contract%20Repository/products_contarct_repo.dart';
import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsContarctRepo)
class ProductsRepoImpl implements ProductsContarctRepo {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  ProductsRepoImpl(this._productsRemoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final productsResponse = await _productsRemoteDataSource.getProducts();
      return Right(productsResponse.data);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }
}
