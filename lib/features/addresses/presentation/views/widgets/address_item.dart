import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.addressEntity,
    required this.isSelected,
  });
  final AddressEntity addressEntity;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 2.5,
                color: AppColors.primaryColor,
              ),
            )
          : null,
      child: ListTile(
        contentPadding: const EdgeInsets.all(6),
        leading: const Icon(
          Icons.location_on_outlined,
          color: Colors.black,
          size: 26,
        ),
        title: Text(
          addressEntity.nameAddress,
          style: AppTextStyles.bold19,
        ),
        subtitle: Text(
          "${addressEntity.city},${addressEntity.details},${addressEntity.region}",
          style: AppTextStyles.semiBold16,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
