import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActoinsHeaderProductDetiles extends StatelessWidget {
  const ActoinsHeaderProductDetiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: Colors.black,
                  )
                ],
              ),
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 24,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 100,
                    color: Colors.black,
                  )
                ],
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 24,
                child: Center(
                  child: Badge(
                    isLabelVisible: context
                            .watch<CartItemCubit>()
                            .cartEntity
                            .cartItems
                            .isNotEmpty
                        ? true
                        : false,
                    label: Text(
                      context
                          .watch<CartItemCubit>()
                          .cartEntity
                          .cartItems
                          .length
                          .toString(),
                      style: AppTextStyles.regular13.copyWith(fontSize: 14),
                    ),
                    child: const Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
