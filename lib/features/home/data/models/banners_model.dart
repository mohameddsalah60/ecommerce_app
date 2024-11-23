import 'package:ecommerce_app/features/home/domin/entites/banners_entity.dart';

class BannersModel extends BannersEntity {
  BannersModel({
    required super.id,
    required super.img,
    required super.category,
    required super.product,
  });
  factory BannersModel.fromJsonData(Map<String, dynamic> data) {
    return BannersModel(
      id: data['id'] as int,
      img: data['image'] as String,
      category: data['category'] ?? {},
      product: data['product'] ?? {},
    );
  }
}
