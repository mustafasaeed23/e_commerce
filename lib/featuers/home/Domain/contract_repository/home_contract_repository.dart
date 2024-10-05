import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/home/Domain/entities/brand.dart';
import 'package:e_commerce/featuers/home/Domain/entities/category.dart';

abstract class HomeContractRepository {
  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, List<Brand>>> getBrands();
}
