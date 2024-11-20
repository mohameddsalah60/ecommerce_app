import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_progress_hud.dart';
import 'package:ecommerce_app/features/home/presentetion/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/sign_in_cubit/sign_in_cubit.dart';
import 'sign_in_view_body.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccsess) {
          customSnackBar(
            context,
            text: 'User logined successfully!',
            color: Colors.green,
          );
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
        } else if (state is SignInFailure) {
          customSnackBar(
            context,
            text: state.errorMessages,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomProgressHud(
            isLoading: state is SignInLoading,
            child: const SafeArea(
              child: SignInViewBody(),
            ),
          ),
        );
      },
    );
  }
}
