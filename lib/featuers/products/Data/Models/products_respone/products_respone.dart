import 'package:e_commerce/featuers/products/Data/Models/products_respone/ProductModel.dart';

import 'metadata.dart';

class ProductsRespone {
  final int? results;
  final Metadata? metadata;
  final List<ProductModel> data;

  const ProductsRespone({this.results, this.metadata, required this.data});

  @override
  String toString() {
    return 'ProductsRespone(results: $results, metadata: $metadata, data: $data)';
  }

  factory ProductsRespone.fromJson(Map<String, dynamic> json) {
    return ProductsRespone(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'results': results,
  //       'metadata': metadata?.toJson(),
  //       'data': data?.map((e) => e.toJson()).toList(),
  //     };
}
