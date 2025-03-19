import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

class OrderItemEntity {
  final int id;
  final num total;
  final String date;
  String? status;
  num? cost, discount, points, vat, pointsCommission;
  String? promoCode, paymentMethod;
  AddressEntity? addressEntity;
  List<ProductEntity>? products;
  List<OrderItemEntity> list = [];
  OrderItemEntity({
    required this.id,
    required this.total,
    required this.date,
    this.status,
    this.cost,
    this.discount,
    this.points,
    this.vat,
    this.pointsCommission,
    this.promoCode,
    this.paymentMethod,
    this.addressEntity,
    this.products,
  });
}
