import 'package:ecommerce_app/features/home/presentetion/views/widgets/cart_item_action_buttons.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cart_item_cubit/cart_item_cubit.dart';
import '../../../../../core/widgets/custom_button.dart';

class AddProductbottomBlocBuilder extends StatelessWidget {
  const AddProductbottomBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        if (state is CartItemAdded) {
          return const CartItemActionButtons(
            count: 1,
          );
        } else if (state is CartItemLoading) {
          return const CustomLoadingIndicator();
        } else {
          return CustomButton(
            text: 'Add to My cart',
            radius: 6,
            onPressed: () {},
          );
        }
      },
    );
  }
}
