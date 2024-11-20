import 'dart:async';

import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomeViewBodyPageview extends StatefulWidget {
  const HomeViewBodyPageview({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyPageviewState createState() => _HomeViewBodyPageviewState();
}

class _HomeViewBodyPageviewState extends State<HomeViewBodyPageview> {
  final PageController _pageController = PageController();
  final int _numPages = 2; // عدد الصفحات في PageView
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
    _timer?.cancel(); // تأكد من إلغاء المؤقت عند التخلص من الودجيت
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
            children: List.generate(_numPages, (index) {
              return AspectRatio(
                aspectRatio: 1,
                child: Image.asset(Assets.imagesBanner1),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        DotsIndicator(
          currnetPageIndex: currnetPageIndex,
          numPages: _numPages,
        ),
      ],
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_pageController.hasClients) {
        final nextPage = (_pageController.page?.toInt() ?? 0) + 1;

        if (nextPage >= _numPages) {
          _pageController
              .jumpToPage(0); // العودة إلى الصفحة الأولى بعد الوصول إلى النهاية
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
