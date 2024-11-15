import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/cart/Domain/Contract%20Repo/cart_contract_repo.dart';
import 'package:e_commerce/featuers/cart/Domain/Entities/cart_entity.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCartUseCase {
  final CartContractRepo cartContractRepo;
  const GetCartUseCase(this.cartContractRepo);

  Future<Either<Failure, CartEntity>> call() => cartContractRepo.getUserCart();
}
