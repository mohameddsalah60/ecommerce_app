import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      width: isActive ? 30 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? AppColors.primaryColor : const Color(0xffE8E8E8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
