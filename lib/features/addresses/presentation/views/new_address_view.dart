import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubit/pin_location_cubit.dart';
import 'package:ecommerce_app/features/addresses/presentation/views/widgets/confirm_address_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/new_address_body.dart';

class NewAddressView extends StatelessWidget {
  const NewAddressView({super.key});
  static const routeName = 'newAddress';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PinLocationCubit(getIt<AddressesRepo>())..getCurrentLocation(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Delivery Address',
          onTap: () => Navigator.of(context).pop(),
        ),
        body: const SafeArea(child: NewAddressBody()),
        bottomNavigationBar: const ConfirmAddressButton(),
      ),
    );
  }
}
