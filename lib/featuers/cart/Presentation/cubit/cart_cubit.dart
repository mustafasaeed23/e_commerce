import 'package:bloc/bloc.dart';
import 'package:e_commerce/featuers/cart/Domain/Use%20Cases/add_to_cart_use_case.dart';
import 'package:e_commerce/featuers/cart/Domain/Use%20Cases/get_cart_use_case.dart';
import 'package:e_commerce/featuers/cart/Presentation/cubit/cart_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._getCartUseCase,
    this._addToCartUseCase,
  ) : super(CartInitial());

  final GetCartUseCase _getCartUseCase;
  final AddToCartUseCase _addToCartUseCase;

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoaded());
    final result = await _addToCartUseCase(productId);
    result.fold((failure) {
      emit(AddToCartError(failure.message));
      print(failure.message);
    }, (result) {
      emit(AddToCartSuccess());
    });
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCartUseCase();
    result.fold((failure) => emit(GetCartError(failure.message),),
        (cart) => emit(GetCartSuccess(cart)));
  }
}
