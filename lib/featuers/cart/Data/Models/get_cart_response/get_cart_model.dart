import 'package:e_commerce/featuers/cart/Domain/Entities/cart_entity.dart';

import 'cart_item_model.dart';

class GetCartModel extends CartEntity {
  final String? id;
  final String? cartOwner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  GetCartModel({
    required super.products,
    required super.totalCartPrice,
    this.id,
    this.cartOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  @override
  String toString() {
    return 'Data(id: $id, cartOwner: $cartOwner, products: $products, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, totalCartPrice: $totalCartPrice)';
  }

  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      id: json['_id'] as String?,
      cartOwner: json['cartOwner'] as String?,
      products: (json['products'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      totalCartPrice: json['totalCartPrice'] as int,
    );
  }
}
