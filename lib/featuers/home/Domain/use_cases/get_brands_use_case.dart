import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/home/Domain/contract_repository/home_contract_repository.dart';
import 'package:e_commerce/featuers/home/Domain/entities/brand.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBrandsUseCase {
  final HomeContractRepository _homeContractRepository;

  GetBrandsUseCase(this._homeContractRepository);

  Future<Either<Failure, List<Brand>>> call() async =>
      _homeContractRepository.getBrands();
}
