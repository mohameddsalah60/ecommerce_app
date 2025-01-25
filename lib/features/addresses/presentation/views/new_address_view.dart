import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/addresses/presentation/views/widgets/confirm_address_button.dart';
import 'package:flutter/material.dart';

import 'widgets/new_address_body.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});
  static const routeName = 'newAddress';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Delivery Address',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: const SafeArea(child: NewAddressBody()),
      bottomNavigationBar: const ConfirmAddressButton(),
    );
  }
}
