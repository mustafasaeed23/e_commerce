class CartProductEntity {
  final String id;
  final String title;
  final String imageCover;
  final double ratingsAverage;

  CartProductEntity(
      {required this.id,
      required this.title,
      required this.imageCover,
      required this.ratingsAverage});
}
