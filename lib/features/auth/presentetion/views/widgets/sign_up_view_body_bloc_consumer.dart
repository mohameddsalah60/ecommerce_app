import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccsess) {
          customSnackBar(
            context,
            text: 'User registered successfully!',
            color: Colors.green,
          );
          Navigator.of(context).pop();
        } else if (state is SignUpFailure) {
          customSnackBar(
            context,
            text: state.errorMessages,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomProgressHud(
            isLoading: state is SignUpLoading,
            child: const SafeArea(
              child: SignUpViewBody(),
            ),
          ),
        );
      },
    );
  }
}
