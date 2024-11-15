class BrandProductsModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const BrandProductsModel({this.id, this.name, this.slug, this.image});

  @override
  String toString() {
    return 'Brand(id: $id, name: $name, slug: $slug, image: $image)';
  }

  factory BrandProductsModel.fromJson(Map<String, dynamic> json) =>
      BrandProductsModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        image: json['image'] as String?,
      );

  // Map<String, dynamic> toJson() => {
  //       '_id': id,
  //       'name': name,
  //       'slug': slug,
  //       'image': image,
  //     };
}
