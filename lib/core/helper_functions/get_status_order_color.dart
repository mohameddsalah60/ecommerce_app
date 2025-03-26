import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status) {
    case 'Cancelled':
    case 'ملغي':
      return Colors.red;
    case 'Under Preparing':
    case 'تحت التجهيز':
      return Colors.orange;
    case 'Prepared':
    case 'تم التجهيز':
      return Colors.blue;
    case 'On Delivery':
    case 'جاري التوصيل':
      return Colors.deepOrange;
    case 'Completed':
    case 'مكتمل':
      return Colors.green;
    default:
      return Colors.black;
  }
}
