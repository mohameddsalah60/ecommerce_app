import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:flutter/material.dart';

import 'widgets/address_detiles_body.dart';

class AddressDetilesView extends StatelessWidget {
  const AddressDetilesView({super.key, required this.addressEntity});
  static const routeName = 'address-detiles';
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'New Address',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: SafeArea(
          child: AddressDetilesBody(
        addressEntity: addressEntity,
      )),
    );
  }
}
