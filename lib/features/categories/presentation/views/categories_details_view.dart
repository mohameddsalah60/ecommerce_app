import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/categories/domin/entites/categories_entity.dart';
import 'package:ecommerce_app/features/categories/domin/repo/categories_repo.dart';
import 'package:ecommerce_app/features/categories/presentation/categories_detiels_cubit/categories_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_details_body.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView(
      {super.key, required this.category, required this.index});
  static const routeName = 'categories-details';
  final List<CategoriesEntity> category;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDetailsCubit(getIt<CategoriesRepo>())
        ..fetchAllProductsByCategoryId(
          categoryId: category[index].id,
        ),
      child: Scaffold(
        body: SafeArea(
            child: CategoriesDetailsBody(
          categories: category,
          index: index,
        )),
      ),
    );
  }
}
