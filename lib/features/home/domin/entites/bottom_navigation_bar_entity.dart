import 'package:ecommerce_app/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String title, icon;

  BottomNavigationBarEntity({required this.title, required this.icon});
}

List<BottomNavigationBarEntity> get bottomNavigationBarlist => [
      BottomNavigationBarEntity(
        title: 'Home',
        icon: Assets.imagesHome,
      ),
      BottomNavigationBarEntity(
        title: 'Cart',
        icon: Assets.imagesCart,
      ),
      BottomNavigationBarEntity(
        title: 'Orders',
        icon: Assets.imagesPaper,
      ),
      BottomNavigationBarEntity(
        title: 'Account',
        icon: Assets.imagesProfile,
      ),
    ];
