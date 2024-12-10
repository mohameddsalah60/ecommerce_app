import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../categories_cubit/categories_details_cubit.dart';
import 'categories_details_grid_view.dart';

class CategoriesDetailsBlocBuilder extends StatelessWidget {
  const CategoriesDetailsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDetailsCubit, CategoriesDetailsState>(
      builder: (context, state) {
        if (state is CategoriesSuccsess) {
          return CategoriesDetailsGridView(
            products: state.products,
          );
        } else if (state is CategoriesFailure) {
          return Text(state.message);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
