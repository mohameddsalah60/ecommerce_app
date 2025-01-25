import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_search_icon.dart';
import 'package:flutter/material.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});
  static const routeName = 'newAddress';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'Delivery Addresses',
          onTap: () => Navigator.of(context).pop(),
          actions: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomSearchIcon(),
            ),
          ]),
    );
  }
}
