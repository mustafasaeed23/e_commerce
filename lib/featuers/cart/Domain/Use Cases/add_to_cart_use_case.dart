import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/cart/Domain/Contract%20Repo/cart_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCartUseCase {
  final CartContractRepo _contractRepo;
  const AddToCartUseCase(this._contractRepo);
  Future<Either<Failure, void>> call(String productId) =>
      _contractRepo.addToCart(productId);
}
