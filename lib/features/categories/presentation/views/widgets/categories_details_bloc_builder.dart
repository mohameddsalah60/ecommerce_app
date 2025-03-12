import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_and_loading.dart';
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
          return const CustomTextAndLoading();
        }
      },
    );
  }
}
