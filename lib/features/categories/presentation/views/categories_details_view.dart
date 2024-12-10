import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/categories/domin/categories_repo.dart';
import 'package:ecommerce_app/features/categories/presentation/categories_cubit/categories_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_details_body.dart';

class CategoriesDetailsView extends StatelessWidget {
  const CategoriesDetailsView({super.key, required this.categoryId});
  static const routeName = 'categories-details';
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDetailsCubit(getIt<CategoriesRepo>())
        ..fetchAllProductsByCategoryId(
          categoryId: categoryId,
        ),
      child: const Scaffold(
        body: SafeArea(child: CategoriesDetailsBody()),
      ),
    );
  }
}
