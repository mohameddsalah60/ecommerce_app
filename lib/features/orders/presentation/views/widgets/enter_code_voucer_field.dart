import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_build_border_field.dart';

class EnterCodeVoucherField extends StatelessWidget {
  const EnterCodeVoucherField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.card_giftcard_outlined),
          prefixIconColor: Colors.black,
          fillColor: Colors.black,
          hintText: 'Enter Code Now',
          hintStyle: AppTextStyles.semiBold16.copyWith(
            color: Colors.black45,
          ),
          focusedBorder: buildBorder(),
          enabledBorder: buildBorder(),
          border: buildBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        ),
        style: AppTextStyles.semiBold16.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
