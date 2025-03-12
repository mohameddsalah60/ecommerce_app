import 'package:ecommerce_app/features/addresses/presentation/cubits/get_addresses_user_cubit/get_addresses_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entites/address_entity.dart';
import 'address_item.dart';

class AddressesListView extends StatefulWidget {
  const AddressesListView({
    super.key,
    required this.addresses,
    required this.selectedAddressNotifier,
  });
  final List<AddressEntity> addresses;
  final ValueNotifier<String> selectedAddressNotifier;

  @override
  State<AddressesListView> createState() => _AddressesListViewState();
}

class _AddressesListViewState extends State<AddressesListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.addresses.length,
        (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedAddressNotifier.value =
                    widget.addresses[index].nameAddress;
              });
              context
                  .read<GetAddressesUserCubit>()
                  .setAddressDefault(addressEntity: widget.addresses[index]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: AddressItem(
                addressEntity: widget.addresses[index],
                isSelected: widget.selectedAddressNotifier.value ==
                    widget.addresses[index].nameAddress,
              ),
            ),
          );
        },
      ),
    );
  }
}
