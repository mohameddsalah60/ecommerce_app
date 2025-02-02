import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/address_detiles_body.dart';

class AddressDetilesView extends StatelessWidget {
  const AddressDetilesView({super.key});
  static const routeName = 'address-detiles';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Address',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: const SafeArea(child: AddressDetilesBody()),
    );
  }
}
