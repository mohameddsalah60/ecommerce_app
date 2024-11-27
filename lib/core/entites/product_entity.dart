class ProductEntity {
  final String name, description, image;
  final int id, discount, oldPrice, price;
  final bool? inFavorites, inCart;
  final List<dynamic> images;

  ProductEntity({
    required this.name,
    required this.description,
    required this.image,
    required this.id,
    required this.discount,
    required this.price,
    required this.oldPrice,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });
}
