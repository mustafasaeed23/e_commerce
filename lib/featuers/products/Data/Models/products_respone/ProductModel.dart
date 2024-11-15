import 'package:e_commerce/featuers/products/Domain/Entities/product_entity.dart';

import 'brand_products_model.dart';
import 'category_products_model.dart';

class ProductModel extends ProductEntity {
  final String? slug;
  final int? quantity;
  final CategoryProducts? category;
  final BrandProductsModel? brand;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priceAfterDiscount;

  const ProductModel({
    this.slug,
    this.quantity,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
    required super.id,
    required super.sold,
    required super.images,
    required super.title,
    required super.description,
    required super.price,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.coverImage,
  });

  @override
  String toString() {
    return 'Datum(sold: $sold, images: $images, ratingsQuantity: $ratingsQuantity, id: $id, title: $title, slug: $slug, description: $description, quantity: $quantity, price: $price, category: $category, brand: $brand, ratingsAverage: $ratingsAverage, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, priceAfterDiscount: $priceAfterDiscount, )';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sold: json['sold'] as int,
        images: (json['images'] as List<dynamic>)
            .map((imageURL) => imageURL.toString())
            .toList(),
        ratingsQuantity: json['ratingsQuantity'] as int,
        id: json['_id'] as String,
        title: json['title'] as String,
        slug: json['slug'] as String?,
        description: json['description'] as String,
        quantity: json['quantity'] as int?,
        price: json['price'] as int,
        coverImage: json['imageCover'] as String,
        category: json['category'] == null
            ? null
            : CategoryProducts.fromJson(
                json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : BrandProductsModel.fromJson(
                json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
      );

  // Map<String, dynamic> toJson() => {
  //       'sold': sold,
  //       'images': images,
  //       'ratingsQuantity': ratingsQuantity,
  //       '_id': id,
  //       'title': title,
  //       'slug': slug,
  //       'description': description,
  //       'quantity': quantity,
  //       'price': price,
  //       'category': category?.toJson(),
  //       'brand': brand?.toJson(),
  //       'ratingsAverage': ratingsAverage,
  //       'createdAt': createdAt?.toIso8601String(),
  //       'updatedAt': updatedAt?.toIso8601String(),
  //       'priceAfterDiscount': priceAfterDiscount,
  //     };
}
