import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/cart/Data/Data%20Source/remote/cart_remote_data_source.dart';
import 'package:e_commerce/featuers/cart/Domain/Contract%20Repo/cart_contract_repo.dart';
import 'package:e_commerce/featuers/cart/Domain/Entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartContractRepo)
class CartImplyRepo implements CartContractRepo {
  final CartRemoteDataSource _cartRemoteDataSource;
  CartImplyRepo(this._cartRemoteDataSource);
  @override
  Future<Either<Failure, void>> addToCart(String productId) async {
    try {
      await _cartRemoteDataSource.addToCart(productId);
      return const Right(null);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getUserCart() async {
    try {
      final cartResponse = await _cartRemoteDataSource.getCart();
      return right(cartResponse.data);
    } on RemoteException catch (exception) {
      print(exception);
      print(exception.message);
      return left(Failure(exception.message));
    }
  }

  @override
  Future deleteFromCart(String productId) async {
    throw UnimplementedError();
  }

  @override
  Future updateCart(String productId, int count) async {
    throw UnimplementedError();
  }
}
