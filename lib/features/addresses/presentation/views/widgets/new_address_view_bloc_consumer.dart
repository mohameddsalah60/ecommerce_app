import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/custom_snack_bar.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../../domain/entites/address_entity.dart';
import '../../cubits/address_actions_cubit/address_actions_cubit.dart';
import 'new_address_detiles_body.dart';

class AddressDetilesViewBlocConsumer extends StatelessWidget {
  const AddressDetilesViewBlocConsumer({
    super.key,
    required this.addressEntity,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddressActionsCubit, AddressActionsState>(
      listener: (context, state) {
        if (state is AddressActionsFailure) {
          customSnackBar(context, text: state.message);
        } else if (state is AddNewAddressSuccsess) {
          Navigator.of(context).pop();
          customSnackBar(
            context,
            text: 'Added New Address Successfully',
            color: Colors.green,
          );
        } else if (state is UpdateAddressSuccsess) {
          Navigator.of(context).pop();
          customSnackBar(
            context,
            text: 'Update Successfully',
            color: Colors.green,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
            child: CustomProgressHud(
                isLoading: state is AddressActionsLoading ? true : false,
                child: AddressDetilesBody(
                  addressEntity: addressEntity,
                )));
      },
    );
  }
}
