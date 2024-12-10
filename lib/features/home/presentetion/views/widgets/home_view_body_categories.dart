import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/service/get_it_service.dart';
import '../../../domin/repos/home_repo.dart';
import 'custom_action_home_view.dart';
import 'custom_grid_view_categories.dart';

class HomeViewBodyCategories extends StatelessWidget {
  const HomeViewBodyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(getIt<HomeRepo>())..getCategories(),
      child: const Column(
        children: [
          CustomActionHomeViewBoy(
            text: 'Categories',
          ),
          SizedBox(
            height: 16,
          ),
          CategoriesBlocBuilder(),
        ],
      ),
    );
  }
}

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccsess) {
          return CustomGridViewCategories(
            categories: state.categories,
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
