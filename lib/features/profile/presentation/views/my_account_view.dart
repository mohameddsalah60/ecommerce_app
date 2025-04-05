import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/profile/presentation/cubits/my_account_cubit/my_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domin/profile_repo.dart';
import 'widgets/my_account_view_body.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({super.key});
  static const String routeName = 'myAccount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'My Account',
        onTap: () => Navigator.pop(context),
      ),
      body: BlocProvider(
        create: (context) => MyAccountCubit(getIt<ProfileRepo>()),
        child: SafeArea(
          child: BlocListener<MyAccountCubit, MyAccountState>(
            listener: (context, state) {
              if (state is MyAccountFailure) {
                customSnackBar(context, text: state.message);
              } else if (state is MyAccountSuccess) {
                customSnackBar(context,
                    text: 'Save Changes Success', color: Colors.green);
              }
            },
            child: const MyAccountViewBody(),
          ),
        ),
      ),
    );
  }
}
