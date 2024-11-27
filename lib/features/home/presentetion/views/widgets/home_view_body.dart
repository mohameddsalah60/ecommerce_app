import 'package:ecommerce_app/core/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/core/repos/product_repo.dart';
import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view_body_categories.dart';
import 'home_view_body_header.dart';
import 'home_view_body_offers.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(getIt<ProductRepo>())..fetchAllProducts(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            HomeViewBodyHeader(),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: HomeViewBodyCategories(),
            ),
            SizedBox(
              height: 16,
            ),
            HomeViewBodyOffers(),
          ],
        ),
      ),
    );
  }
}
