import 'package:flutter/material.dart';

class CheckoutBorderWidgets extends StatelessWidget {
  const CheckoutBorderWidgets({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: child,
    );
  }
}
