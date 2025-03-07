import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubits/pin_location_cubit/pin_location_cubit.dart';
import 'package:ecommerce_app/features/addresses/presentation/views/widgets/confirm_address_map_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/address_map_body.dart';

class AddressMapView extends StatelessWidget {
  const AddressMapView({super.key});
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
        body: const SafeArea(child: AddressMapBody()),
        bottomNavigationBar: const ConfirmAddressMapButton(),
      ),
    );
  }
}
