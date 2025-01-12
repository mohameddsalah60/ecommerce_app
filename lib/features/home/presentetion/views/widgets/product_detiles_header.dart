import 'package:ecommerce_app/core/widgets/custom_image_network.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import 'actions_header_product_detiles.dart';
import '../../../../../core/widgets/dots_indicator.dart';

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
              return CustomImageNetwork(image: widget.images[index]);
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
