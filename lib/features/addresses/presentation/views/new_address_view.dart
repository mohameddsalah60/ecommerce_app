import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entites/address_entity.dart';
import '../../domain/repos/addresses_repo.dart';
import '../cubits/address_actions_cubit/address_actions_cubit.dart';
import 'widgets/new_address_view_bloc_consumer.dart';

class AddressDetilesView extends StatelessWidget {
  const AddressDetilesView({super.key, required this.addressEntity});
  static const routeName = 'address-detiles';
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressActionsCubit(getIt<AddressesRepo>()),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'New Address',
          onTap: () => Navigator.of(context).pop(),
          actions: [
            addressEntity.id != null
                ? BlocProvider(
                    create: (context) =>
                        AddressActionsCubit(getIt<AddressesRepo>()),
                    child: DeleteAddressButton(addressEntity: addressEntity),
                  )
                : const SizedBox(),
          ],
        ),
        body: AddressDetilesViewBlocConsumer(addressEntity: addressEntity),
      ),
    );
  }
}

class DeleteAddressButton extends StatelessWidget {
  const DeleteAddressButton({
    super.key,
    required this.addressEntity,
  });

  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
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
  }
}
