import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class YourDataIsEmpty extends StatelessWidget {
  const YourDataIsEmpty({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.imagesDataIsEmpty),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: AppTextStyles.semiBold16,
          ),
        ],
      ),
    );
  }
}
