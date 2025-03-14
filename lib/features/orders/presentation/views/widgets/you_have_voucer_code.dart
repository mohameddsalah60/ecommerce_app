import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';

class YouHaveVoucherCode extends StatelessWidget {
  const YouHaveVoucherCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'You Have A Voucher Code ?',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(
          Assets.imagesVoucher,
          height: 30,
        ),
      ],
    );
  }
}
