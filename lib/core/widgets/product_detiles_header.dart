import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'actions_header_product_detiles.dart';
import 'custom_loading_indicator.dart';
import 'dots_indicator.dart';

class ProductDetilesHeader extends StatefulWidget {
  const ProductDetilesHeader({super.key, required this.images});
  final List<dynamic> images;
  @override
  State<ProductDetilesHeader> createState() => _ProductDetilesHeaderState();
}

class _ProductDetilesHeaderState extends State<ProductDetilesHeader> {
  final PageController _pageController = PageController();
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .40,
      child: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.images[index],
                width: MediaQuery.sizeOf(context).width,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const Center(child: CustomLoadingIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
          const ActoinsHeaderProductDetiles(),
          widget.images.length != 1
              ? Positioned(
                  bottom: 20,
                  right: 0,
                  left: 0,
                  child: DotsIndicator(
                    currnetPageIndex: _currentPage.round(),
                    numPages: widget.images.length,
                    activeColor: AppColors.primaryColor,
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}
