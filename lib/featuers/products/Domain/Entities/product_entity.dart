import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final int sold;
  final List<String> images;
  final String coverImage;
  final String title;
  final String description;
  final int price;
  final double ratingsAverage;
  final int ratingsQuantity;

  const ProductEntity({
    required this.id,
    required this.sold,
    required this.images,
    required this.coverImage,
    required this.title,
    required this.description,
    required this.price,
    required this.ratingsAverage,
    required this.ratingsQuantity,
  });

  @override
  List<Object?> get props => [id];
}
