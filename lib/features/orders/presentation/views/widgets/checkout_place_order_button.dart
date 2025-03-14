import 'package:ecommerce_app/core/helper_functions/get_addresses_user.dart';
import 'package:ecommerce_app/features/orders/presentation/cubits/add_new_order_cubit/add_new_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_button.dart';

class CheckoutPlaceOrderButton extends StatelessWidget {
  const CheckoutPlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .15,
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
            color: Colors.black,
            width: 1,
          ))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomButton(
              onPressed: () {
                context.read<AddNewOrderCubit>().addNewOrderUser(
                      addressID: getAddresses().id!,
                      usePoints: false,
                    );
              },
              text: "Place Order",
              backgroundColor: AppColors.primaryColor,
              radius: 16,
            ),
          ),
        ],
      ),
    );
  }
}
