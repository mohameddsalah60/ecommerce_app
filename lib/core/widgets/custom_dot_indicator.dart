import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator(
      {super.key, required this.isActive, required this.activeColor});
  final bool isActive;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 300,
      ),
      width: isActive ? 30 : 8,
      height: 8,
      decoration: ShapeDecoration(
        color: isActive ? activeColor : Colors.white30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
