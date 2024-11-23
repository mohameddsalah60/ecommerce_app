class BannersEntity {
  final int id;
  final String img;
  final Map<String, dynamic> category;
  final Map<String, dynamic> product;

  BannersEntity(
      {required this.id,
      required this.img,
      required this.category,
      required this.product});
}
