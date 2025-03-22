import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SearchImageAndText extends StatelessWidget {
  const SearchImageAndText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.imagesSerach),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'Search',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          text,
          style: AppTextStyles.semiBold16,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
