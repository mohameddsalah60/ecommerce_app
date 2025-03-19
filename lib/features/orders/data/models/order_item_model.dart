import 'package:ecommerce_app/core/models/product_model.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  OrderItemModel({
    required super.id,
    required super.total,
    required super.date,
    super.status,
    super.cost,
    super.discount,
    super.points,
    super.vat,
    super.pointsCommission,
    super.promoCode,
    super.paymentMethod,
    super.addressEntity,
    super.products,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> data) {
    return OrderItemModel(
      id: data['id'],
      total: data['total'],
      date: data['date'] ?? '',
      status: data['status'] ?? 'New',
      cost: data['cost'],
      discount: data['discount'],
      points: data['points'],
      vat: data['vat'],
      pointsCommission: data['points_commission'],
      promoCode: data['promo_code'] ?? "----",
      paymentMethod: data['payment_method'],
      addressEntity: data['address'] != null
          ? AddressModel.fromJson(data['address'])
          : null,
      products: data['products'] != null
          ? (data['products'] as List<dynamic>)
              .map((item) => ProductModel.fromJson(item))
              .toList()
          : [],
    );
  }
  factory OrderItemModel.fromEntity(OrderItemEntity orderItemEntity) {
    return OrderItemModel(
        id: orderItemEntity.id,
        total: orderItemEntity.total,
        date: orderItemEntity.date,
        status: orderItemEntity.status);
  }
  toMap() {
    return {
      'id': id,
      'total': total,
      'date': date,
      'status': status,
      'cost': cost,
      'discount': discount,
      'points': points,
      'vat': vat,
      'points_commission': pointsCommission,
      'promo_code': promoCode,
      'payment_method': paymentMethod,
      'address': addressEntity != null
          ? (addressEntity as AddressModel).toMap()
          : null,
      'products': products != null
          ? (products as List<ProductModel>)
              .map((product) => product.toMap())
              .toList()
          : null,
    };
  }
}
