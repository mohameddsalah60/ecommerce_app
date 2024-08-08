import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

Future<void> selectLanguageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .12,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'English',
              style: AppStyles.bold19,
            ),
            const SizedBox(
              height: 6,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'العربية',
              style: AppStyles.bold19,
            ),
          ],
        ),
      );
    },
  );
}
