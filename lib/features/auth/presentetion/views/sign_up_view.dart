import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentetion/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sign_up_view_body_bloc_consumer.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        getIt<AuthRepo>(),
      ),
      child: const SignUpViewBodyBlocConsumer(),
    );
  }
}
