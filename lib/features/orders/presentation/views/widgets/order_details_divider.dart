import 'package:flutter/material.dart';

class OrderDetailsDivider extends StatelessWidget {
  const OrderDetailsDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Divider(
          color: Colors.black26,
          thickness: 1,
        ),
      ),
    );
  }
}
