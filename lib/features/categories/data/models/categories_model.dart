import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';

class CategoriesModel extends CategoriesEntity {
  CategoriesModel({required super.name, required super.img, required super.id});

  factory CategoriesModel.fromJsonData(Map<String, dynamic> data) {
    return CategoriesModel(
      name: data['name'] as String,
      img: data['image'] as String,
      id: data['id'] as int,
    );
  }
}
