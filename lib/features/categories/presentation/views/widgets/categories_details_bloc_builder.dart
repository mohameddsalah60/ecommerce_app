import 'package:ecommerce_app/core/entites/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_product_item.dart';
import '../../../../../core/widgets/custom_skeletonizer_loading.dart';
import '../../categories_detiels_cubit/categories_details_cubit.dart';
import 'categories_details_grid_view.dart';

class CategoriesDetailsBlocBuilder extends StatelessWidget {
  const CategoriesDetailsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsState>(
      builder: (context, state) {
        if (state is CategoriesDetailsSuccsess) {
          return CategoriesDetailsGridView(
            products: state.products,
          );
        } else if (state is CategoriesDetailsFailure) {
          return Text(state.message);
        } else {
          return CustomSkeletonizerLoading(
              isLoading: state is CategoriesDetailsLoading ? true : false,
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    2,
                    (index) => CustomProductItem(
                      productEntity: ProductEntity(
                          name: 'Product Loading........',
                          description: '',
                          image: '',
                          id: 0,
                          discount: 0,
                          price: 4000,
                          oldPrice: 5000,
                          inFavorites: false,
                          inCart: false,
                          images: []),
                    ),
                  ),
                ),
              ));
        }
      },
    );
  }
}
