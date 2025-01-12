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
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: CustomImageNetwork(
          image: img,
          borderRadius: 16,
        ),
      ),
    );
  }
}
