
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/home/Data/data_sources/remote/home_remote_data_source.dart';
import 'package:e_commerce/featuers/home/Domain/contract_repository/home_contract_repository.dart';
import 'package:e_commerce/featuers/home/Domain/entities/brand.dart';
import 'package:e_commerce/featuers/home/Domain/entities/category.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeContractRepository)
class HomeRepositoryImpl implements HomeContractRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categoriesResponse = await _homeRemoteDataSource.getCategories();
      return Right(categoriesResponse.data);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final brandsResponse = await _homeRemoteDataSource.getBrands();
      return Right(brandsResponse.data);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
