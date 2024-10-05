import 'package:e_commerce/featuers/home/Domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/featuers/home/Domain/use_cases/get_categoreis_use_case.dart';
import 'package:e_commerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._categoreisUseCase, this._brandsUseCase)
      : super(HomeInitial());

  final GetCategoreisUseCase _categoreisUseCase;
  final GetBrandsUseCase _brandsUseCase;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _categoreisUseCase.call();
    result.fold((failure) {
      emit(GetCategoriesError(failure.message));
    }, (categoriesList) {
      emit(GetCategoresSuccess(categoriesList));
    });
  }

  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    final result = await _brandsUseCase.call();
    result.fold((failure) => emit(GetBrandsError(failure.message)),
        (brandsList) => emit(GetBrandsSuccess(brandsList)));
  }
}
