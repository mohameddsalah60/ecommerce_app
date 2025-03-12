import 'package:ecommerce_app/core/service/get_it_service.dart';

import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubits/get_addresses_user_cubit/get_addresses_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_text_styles.dart';

import 'widgets/add_new_address_button.dart';
import 'widgets/addresses_list_view_bloc_builder.dart';

Future<void> selectDeliveryAddress(
    BuildContext context, ValueNotifier<String> value) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    builder: (context) => BlocProvider(
      create: (context) =>
          GetAddressesUserCubit(getIt<AddressesRepo>())..getAddressesUser(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select delivery address',
                  style: AppTextStyles.bold19,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              AddressesListViewBlocBuilder(
                value: value,
              ),
              const Spacer(),
              const AddNewAddressButton(),
              const SizedBox(
                height: 62,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
