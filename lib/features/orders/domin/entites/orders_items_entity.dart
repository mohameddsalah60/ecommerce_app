import 'package:ecommerce_app/features/orders/data/models/order_item_model.dart';
import 'package:ecommerce_app/features/orders/domin/entites/order_item_entity.dart';

class OrdersItemsEntity {
  List<OrderItemEntity> orders;

  OrdersItemsEntity({required this.orders});
  bool isExist(int orderID) {
    return orders.any((item) => item.id == orderID);
  }

  addOrder(OrderItemEntity order) {
    orders.add(order);
  }

  removeOrderByID(OrderItemModel order) {
    int index = orders.indexWhere((item) {
      return item.id == order.id;
    });

    orders.removeAt(index);
  }
}
