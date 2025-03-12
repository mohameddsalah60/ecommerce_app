import 'package:ecommerce_app/core/helper_functions/get_addresses_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../addresses/presentation/views/select_delivery_address_view.dart';

final addressNotifier = ValueNotifier<String>(getAddresses().nameAddress);

class AddressUserHomeView extends StatelessWidget {
  const AddressUserHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectDeliveryAddress(context, addressNotifier);
      },
      child: Row(
        children: [
          const AddressName(),
          const SizedBox(
            width: 6,
          ),
          SvgPicture.asset(
            Assets.imagesArrowDown,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 16,
          ),
        ],
      ),
    );
  }
}

class AddressName extends StatelessWidget {
  const AddressName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: addressNotifier,
      builder: (context, selectedAddress, child) {
        return Text(
          selectedAddress.isEmpty
              ? getAddresses().nameAddress
              : selectedAddress,
          style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
        );
      },
    );
  }
}
