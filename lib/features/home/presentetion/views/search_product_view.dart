import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/presentetion/cubits/serach_product_cubit/serach_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_product_view_body.dart';

class SearchProductView extends StatelessWidget {
  const SearchProductView({super.key});
  static const routeName = 'search-view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'Search Products',
        onTap: () => Navigator.of(context).pop(),
      ),
      body: BlocProvider(
        create: (context) => SerachProductCubit(getIt<HomeRepo>()),
        child: const SearchProductViewBody(),
      ),
    );
  }
}
