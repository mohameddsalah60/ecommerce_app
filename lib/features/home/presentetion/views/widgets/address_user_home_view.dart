import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubits/get_addresses_user_cubit/get_addresses_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../addresses/presentation/views/address_map_view.dart';

class AddressUserHomeView extends StatelessWidget {
  const AddressUserHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAddressesUserCubit(getIt<AddressesRepo>())..getAddressesUser(),
      child: GestureDetector(
        onTap: () {
          List addresses =
              SharedPreferencesService.getData(key: 'addresses') ?? [];
          if (addresses.isEmpty) {
            Navigator.of(context).pushNamed(AddressMapView.routeName);
          } else {
            Navigator.of(context).pushNamed(AddressMapView.routeName);
          }
        },
        child: Row(
          children: [
            const AddressName(),
            const SizedBox(
              width: 6,
            ),
            SvgPicture.asset(
              Assets.imagesArrowDown,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class AddressName extends StatelessWidget {
  const AddressName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAddressesUserCubit, GetAddressesUserState>(
      builder: (context, state) {
        if (state is GetAddressesUserSuccsess) {
          return Text(
            state.addresses.isEmpty
                ? 'Not available address yet'
                : state.addresses.last.nameAddress,
            style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
          );
        } else if (state is GetAddressesUserFailure) {
          return Text(
            'Unable to load your addresses',
            style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
          );
        } else {
          return Text(
            'Not available address yet',
            style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
          );
        }
      },
    );
  }
}
