import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../new_address_view.dart';

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
    return ListTile(
      contentPadding: const EdgeInsets.all(6),
      leading: Icon(
        isSelected ? Icons.check_circle : Icons.location_on_outlined,
        color: isSelected ? Colors.green : Colors.black,
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
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(
            AddressDetilesView.routeName,
            arguments: addressEntity,
          );
        },
        child: const Icon(
          Icons.more_horiz,
          color: Colors.black26,
          size: 26,
        ),
      ),
    );
  }
}
