import 'package:e_commerce/featuers/home/Domain/entities/brand.dart';
import 'package:e_commerce/featuers/home/Domain/entities/category.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoading extends HomeState {}

class GetCategoresSuccess extends HomeState {
  final List<Category> categoriesList;
  GetCategoresSuccess(this.categoriesList);
}

class GetCategoriesError extends HomeState {
  final String message;
  GetCategoriesError(this.message);
}

class GetBrandsLoading extends HomeState {}

class GetBrandsSuccess extends HomeState {
  final List<Brand> brandsList;
  GetBrandsSuccess(this.brandsList);
}

class GetBrandsError extends HomeState {
  final String message;
  GetBrandsError(this.message);
}
