import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/addresses/presentation/cubits/get_addresses_user_cubit/get_addresses_user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../addresses/presentation/views/select_delivery_address_view.dart';

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
          selectDeliveryAddress(context);
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
    return Text(
      context.watch<GetAddressesUserCubit>().address ??
          'Not available address yet',
      style: AppTextStyles.semiBold16.copyWith(color: Colors.white),
    );
  }
}
