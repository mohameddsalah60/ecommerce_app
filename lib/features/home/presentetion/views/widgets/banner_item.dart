import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/widgets/dots_indicator.dart';
import '../../../domin/entites/banners_entity.dart';
import 'banner_img.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({
    super.key,
    required this.list,
  });

  final List<BannersEntity> list;

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem> {
  final PageController _pageController = PageController();
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
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .21,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            children: List.generate(
              widget.list.length,
              (index) {
                return BannerImg(img: widget.list[index].img);
              },
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        DotsIndicator(
          currnetPageIndex: currnetPageIndex,
          numPages: widget.list.length,
        ),
      ],
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page?.toInt() ?? 0) + 1;

        if (nextPage >= widget.list.length) {
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
