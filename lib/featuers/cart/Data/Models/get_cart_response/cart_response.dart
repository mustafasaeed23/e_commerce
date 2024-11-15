import 'get_cart_model.dart';

class CartResponse {
  final String? status;
  final int? numOfCartItems;
  final GetCartModel data;

  CartResponse({
    this.status,
    this.numOfCartItems,
    required this.data,
  });

  @override
  String toString() {
    return 'GetCartResponse(status: $status, numOfCartItems: $numOfCartItems, data: $data)';
  }

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      data: GetCartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
