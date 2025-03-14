import '../../../../core/utils/app_images.dart';

class PaymentItem {
  final String title, icon;
  final int value;

  PaymentItem({required this.title, required this.icon, required this.value});
}

List<PaymentItem> get listOfPay => [
      PaymentItem(
          title: 'Cash on Delivery.',
          value: 1,
          icon: Assets.imagesCashOnDelivery),
      PaymentItem(title: 'Apple Pay.', value: 3, icon: Assets.imagesApplePay),
      PaymentItem(title: 'Credit Card.', value: 2, icon: Assets.imagesVisa),
    ];
