import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';

class BannerImg extends StatelessWidget {
  const BannerImg({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: img != ''
          ? CustomImageNetwork(
              image: img,
              borderRadius: 16,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                Assets.imagesBanner1,
                fit: BoxFit.fill,
              ),
            ),
    );
  }
}
