import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubit/pin_location_cubit.dart';
import 'package:ecommerce_app/features/addresses/presentation/views/address_detiles_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class ConfirmAddressButton extends StatelessWidget {
  const ConfirmAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .15,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            leading: const Icon(
              Icons.location_on_rounded,
              size: 32,
              color: AppColors.primaryColor,
            ),
            title: Text(
              context.watch<PinLocationCubit>().address,
              style: AppTextStyles.bold16,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AddressDetilesView.routeName,
                  arguments: context.read<PinLocationCubit>().addressEntity,
                );
              },
              text: "Confirm pin location",
              radius: 24,
            ),
          ),
        ],
      ),
    );
  }
}
