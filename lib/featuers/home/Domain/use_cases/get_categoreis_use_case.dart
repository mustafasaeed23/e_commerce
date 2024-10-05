import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/home/Domain/contract_repository/home_contract_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/category.dart';

@lazySingleton
class GetCategoreisUseCase {
  final HomeContractRepository _homeContractRepository;

  GetCategoreisUseCase(this._homeContractRepository);

  Future<Either<Failure, List<Category>>> call() async =>
      _homeContractRepository.getCategories();


}
