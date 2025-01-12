import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({
    super.key,
    this.onTapAdd,
    this.onTapRemove,
    this.sizeIcon = 32,
    required this.count,
  });
  final void Function()? onTapAdd, onTapRemove;
  final int count;
  final double sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTapAdd,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add,
                color: Colors.green,
                size: sizeIcon,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            "$count",
            style: AppTextStyles.semiBold20,
          ),
          const SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: onTapRemove,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                count <= 1 ? Icons.delete : Icons.remove,
                color: Colors.redAccent,
                size: sizeIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
