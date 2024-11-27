import 'package:ecommerce_app/core/entites/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.name,
    required super.description,
    required super.image,
    required super.id,
    required super.discount,
    required super.price,
    required super.oldPrice,
    required super.inFavorites,
    required super.inCart,
    required super.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'],
      description: data['description'],
      image: data['image'],
      id: data['id'],
      discount: data['discount'] ?? 0,
      price: (data['price'] ?? 0 as num).toInt(),
      oldPrice: (data['oldPrice'] ?? 0 as num).toInt(),
      inFavorites: data['inFavorites'] ?? false,
      inCart: data['inCart'] ?? false,
      images: data['images'],
    );
  }
}
