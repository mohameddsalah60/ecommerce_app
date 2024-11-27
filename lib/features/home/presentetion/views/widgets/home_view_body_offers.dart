import 'package:ecommerce_app/core/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_action_home_view.dart';
import 'offers_listview.dart';

class HomeViewBodyOffers extends StatelessWidget {
  const HomeViewBodyOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomActionHomeViewBoy(
            text: 'One Day Offers! 🔥',
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
            if (state is ProductFailure) {
              customSnackBar(context, text: state.message);
            }
          },
          builder: (context, state) {
            if (state is ProductSuccsess) {
              return OffersListview(
                products: state.products,
              );
            } else if (state is ProductLoading) {
              return const Center(child: CustomLoadingIndicator());
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
