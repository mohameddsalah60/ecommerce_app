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
    super.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data) {
    return ProductModel(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      id: data['id'],
      discount: data['discount'] ?? 0,
      price: (data['price'] ?? 0 as num).toInt(),
      oldPrice: (data['old_price'] ?? 0 as num).toInt(),
      inFavorites: data['in_favorites'] ?? false,
      inCart: data['in_cart'] ?? false,
      images: data['images'] ?? [],
      quantity: (data['quantity'] ?? 0 as num).toInt(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'id': id,
      'discount': discount,
      'price': price,
      'old_price': oldPrice,
      'in_favorites': inFavorites,
      'in_cart': inCart,
      'images': images,
      'quantity': quantity,
    };
  }
}
