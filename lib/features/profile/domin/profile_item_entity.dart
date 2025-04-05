import 'package:ecommerce_app/core/utils/app_images.dart';

class ProfileItemEntity {
  final String img, text;

  ProfileItemEntity({required this.img, required this.text});
}

List<ProfileItemEntity> get items => [
      ProfileItemEntity(img: Assets.imagesProfile, text: 'My Account'),
      ProfileItemEntity(img: Assets.imagesBox, text: 'My Orders'),
      ProfileItemEntity(img: Assets.imagesHeart, text: 'My Favorites'),
      ProfileItemEntity(img: Assets.imagesNotification, text: 'Notifications'),
      ProfileItemEntity(img: Assets.imagesMagicpen, text: 'Theme'),
    ];
