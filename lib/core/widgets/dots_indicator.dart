import 'package:flutter/material.dart';

import 'custom_dot_indicator.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator(
      {super.key,
      required this.currnetPageIndex,
      required this.numPages,
      this.activeColor = Colors.white});
  final int numPages;
  final int currnetPageIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numPages,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CustomDotIndicator(
            activeColor: activeColor,
            isActive: index == currnetPageIndex,
          ),
        ),
      ),
    );
  }
}
