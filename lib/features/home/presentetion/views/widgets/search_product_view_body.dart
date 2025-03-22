import 'package:ecommerce_app/features/home/presentetion/cubits/serach_product_cubit/serach_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_textfield_search.dart';
import 'search_product_view_body_bloc_builder.dart';

class SearchProductViewBody extends StatelessWidget {
  const SearchProductViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          CustomTextfieldSearch(
            textFieldColor: Colors.black,
            onChanged: (value) =>
                context.read<SerachProductCubit>().textFieldChange(value),
          ),
          const SizedBox(
            height: 16,
          ),
          const SearchProductViewBodyBlocBuilder(),
        ],
      ),
    );
  }
}
