import 'package:ecommerce_app/features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/orders/domin/entites/orders_items_entity.dart';

class OrdersItemsModel extends OrdersItemsEntity {
  OrdersItemsModel({required super.orders});
  factory OrdersItemsModel.fromJson(Map<String, dynamic> data) {
    return OrdersItemsModel(
      orders: (data['data'] as List<dynamic>)
          .map((item) => OrderItemModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
