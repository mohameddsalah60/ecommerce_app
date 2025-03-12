import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_and_loading.dart';
import '../../cubits/get_addresses_user_cubit/get_addresses_user_cubit.dart';
import 'addresses_list_view.dart';

class AddressesListViewBlocBuilder extends StatelessWidget {
  const AddressesListViewBlocBuilder({
    super.key,
    required this.value,
  });
  final ValueNotifier<String> value;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressesUserCubit, GetAddressesUserState>(
      builder: (context, state) {
        if (state is GetAddressesUserSuccsess) {
          if (state.addresses.isNotEmpty) {
            return AddressesListView(
              addresses: state.addresses,
              selectedAddressNotifier: value,
            );
          } else {
            return Column(
              children: [
                SvgPicture.asset(
                  Assets.imagesDataIsEmpty,
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "You haven't added any addresses yet.\nStart by adding a new one now!",
                  style: AppTextStyles.semiBold16,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          }
        } else if (state is GetAddressesUserFailure) {
          return Text(state.message);
        } else {
          return const CustomTextAndLoading();
        }
      },
    );
  }
}
