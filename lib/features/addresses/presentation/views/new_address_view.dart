import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/service/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/entites/address_entity.dart';
import '../../domain/repos/addresses_repo.dart';
import '../cubits/add_new_address_cubit/add_new_address_cubit.dart';
import 'widgets/new_address_view_bloc_consumer.dart';

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
      body: BlocProvider(
        create: (context) => AddNewAddressCubit(getIt<AddressesRepo>()),
        child: AddressDetilesViewBlocConsumer(addressEntity: addressEntity),
      ),
    );
  }
}
