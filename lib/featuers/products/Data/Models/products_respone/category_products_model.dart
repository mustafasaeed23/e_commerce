class CategoryProducts {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  const CategoryProducts({this.id, this.name, this.slug, this.image});

  @override
  String toString() {
    return 'Category(id: $id, name: $name, slug: $slug, image: $image)';
  }

  factory CategoryProducts.fromJson(Map<String, dynamic> json) =>
      CategoryProducts(
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
