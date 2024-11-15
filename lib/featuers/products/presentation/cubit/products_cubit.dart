import 'package:bloc/bloc.dart';
import 'package:e_commerce/featuers/products/Domain/Use%20Cases/get_products_use_case.dart';
import 'package:e_commerce/featuers/products/presentation/cubit/products_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductsUseCase) : super(ProductsInitial());
  final GetProductsUseCase _getProductsUseCase;
  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    final result = await _getProductsUseCase.call();
    result.fold((failure) {
      emit(ProductsFailureState(failure.message));
    }, (productsList) {
      emit(ProductsSuccessState(productsList));
    });
  }
}
