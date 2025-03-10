import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../address_map_view.dart';

class AddNewAddressButton extends StatelessWidget {
  const AddNewAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushReplacementNamed(AddressMapView.routeName),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            size: 24,
            color: AppColors.primaryColor,
          ),
          Text(
            'Add New Address',
            style: AppTextStyles.bold19.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
