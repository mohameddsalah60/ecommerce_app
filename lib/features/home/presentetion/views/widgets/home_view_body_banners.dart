import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/service/get_it_service.dart';

import 'package:ecommerce_app/core/widgets/custom_skeletonizer_loading.dart';
import 'package:ecommerce_app/features/home/domin/entites/banners_entity.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/banners_cubit/banners_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domin/repos/home_repo.dart';
import 'banner_item.dart';

class HomeViewBodyBanners extends StatelessWidget {
  const HomeViewBodyBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannersCubit(getIt<HomeRepo>())..getBanners(),
      child: BlocConsumer<BannersCubit, BannersState>(
        listener: (context, state) {
          if (state is BannersFailure) {
            customSnackBar(context, text: state.message);
          }
        },
        builder: (context, state) {
          if (state is BannersSuccsess) {
            return BannerItem(
              list: state.banners,
            );
          } else if (state is BannersFailure) {
            return const SizedBox();
          } else {
            return CustomSkeletonizerLoading(
                isLoading: state is BannersLoading ? true : false,
                child: BannerItem(
                  list: List.generate(
                    3,
                    (index) => BannersEntity(
                        id: 10, img: '', category: {}, product: {}),
                  ),
                ));
          }
        },
      ),
    );
  }
}
