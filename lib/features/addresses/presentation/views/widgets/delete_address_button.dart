import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../domain/entites/address_entity.dart';
import '../../cubits/address_actions_cubit/address_actions_cubit.dart';

class DeleteAddressButton extends StatelessWidget {
  const DeleteAddressButton({
    super.key,
    required this.addressEntity,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressActionsCubit, AddressActionsState>(
      listener: (context, state) {
        if (state is DeleteAddressSuccsess) {
          Navigator.of(context).pop();
          customSnackBar(
            context,
            text: 'Deleted Successfully',
            color: Colors.green,
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context
                .read<AddressActionsCubit>()
                .deleteAddressUser(addressEntity: addressEntity);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(right: 16),
            child: Text(
              'Delete',
              style: AppTextStyles.bold13.copyWith(color: Colors.red),
            ),
          ),
        );
      },
    );
  }
}
