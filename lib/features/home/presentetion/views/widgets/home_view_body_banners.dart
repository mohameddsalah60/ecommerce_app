import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/core/widgets/dots_indicator.dart';
import 'package:ecommerce_app/features/home/cubits/banners_cubit/banners_cubit.dart';
import 'package:ecommerce_app/features/home/domin/entites/banners_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBodyBanners extends StatefulWidget {
  const HomeViewBodyBanners({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyBannersState createState() => _HomeViewBodyBannersState();
}

class _HomeViewBodyBannersState extends State<HomeViewBodyBanners> {
  final PageController _pageController = PageController();
  int? _numPages;
  Timer? _timer;
  int currnetPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _listenerDotsIndicator();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannersCubit(getIt<HomeRepo>())..getBanners(),
      child: BlocBuilder<BannersCubit, BannersState>(
        builder: (context, state) {
          if (state is BannersSuccsess) {
            _numPages = state.banners.length;
            return BannerItem(
              pageController: _pageController,
              currnetPageIndex: currnetPageIndex,
              list: state.banners,
            );
          } else if (state is BannersFailure) {
            return Text(state.message);
          } else {
            return Container(
              height: MediaQuery.sizeOf(context).height * .228,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                  child:
                      CustomLoadingIndicator(color: AppColors.greyLightColor)),
            );
          }
        },
      ),
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page?.toInt() ?? 0) + 1;

        if (nextPage >= _numPages!) {
          _pageController.jumpToPage(0);
        } else {
          _pageController.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  void _listenerDotsIndicator() {
    return _pageController.addListener(() {
      currnetPageIndex = _pageController.page!.round();
      setState(() {});
    });
  }
}

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required PageController pageController,
    required this.currnetPageIndex,
    required this.list,
  }) : _pageController = pageController;

  final PageController _pageController;
  final int currnetPageIndex;
  final List<BannersEntity> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .21,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            children: List.generate(list.length, (index) {
              return AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: list[index].img,
                  placeholder: (context, url) =>
                      const Center(child: CustomLoadingIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DotsIndicator(
          currnetPageIndex: currnetPageIndex,
          numPages: list.length,
        ),
      ],
    );
  }
}
