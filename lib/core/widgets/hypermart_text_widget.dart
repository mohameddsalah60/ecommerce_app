import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class HyperMartTextWidget extends StatelessWidget {
  const HyperMartTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: [
          TextSpan(
            text: 'Hyper',
            style:
                AppTextStyles.bold28.copyWith(color: const Color(0xffFF7C66)),
          ),
          TextSpan(
            text: 'Mart',
            style:
                AppTextStyles.bold28.copyWith(color: AppColors.secnderyColor),
          ),
        ]));
  }
}
