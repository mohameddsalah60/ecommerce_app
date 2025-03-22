import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_product_item.dart';
import '../../../../../core/widgets/custom_text_and_loading.dart';
import '../../cubits/serach_product_cubit/serach_product_cubit.dart';
import '../product_detiles_view.dart';
import 'search_image_and_text.dart';

class SearchProductViewBodyBlocBuilder extends StatelessWidget {
  const SearchProductViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SerachProductCubit, SerachProductState>(
      builder: (context, state) {
        if (state is SerachProductSuccess) {
          return Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed(
                    ProductDetilesView.routeName,
                    arguments: {
                      'index': index,
                      'products': state.products,
                    },
                  ),
                  child: CustomProductItem(
                    productEntity: state.products[index],
                  ),
                );
              },
            ),
          );
        } else if (state is SerachProductFailure) {
          return const SearchImageAndText(
            text: 'Sorry... This information is not available at the moment.',
          );
        } else if (state is SerachProductLoading) {
          return const CustomTextAndLoading();
        } else {
          return const SearchImageAndText(
            text: 'Start the search now.',
          );
        }
      },
    );
  }
}
