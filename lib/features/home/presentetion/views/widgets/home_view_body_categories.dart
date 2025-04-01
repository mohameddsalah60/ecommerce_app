import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/categories/domin/repo/categories_repo.dart';
import 'package:ecommerce_app/features/categories/presentation/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/service/get_it_service.dart';
import '../../../../../core/widgets/custom_skeletonizer_loading.dart';
import 'custom_action_home_view.dart';
import '../../../../categories/presentation/views/widgets/custom_grid_view_categories.dart';

class HomeViewBodyCategories extends StatelessWidget {
  const HomeViewBodyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesCubit(getIt<CategoriesRepo>())..getCategories(),
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
          return CustomSkeletonizerLoading(
              isLoading: state is CategoriesLoading ? true : false,
              child: CustomGridViewCategories(
                categories: List.generate(
                  6,
                  (index) =>
                      CategoriesEntity(name: 'Loading....', img: '', id: 0),
                ),
              ));
        }
      },
    );
  }
}
