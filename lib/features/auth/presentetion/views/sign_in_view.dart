import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentetion/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sign_in_view_body_bloc_consumer.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        getIt<AuthRepo>(),
      ),
      child: const SignInViewBodyBlocConsumer(),
    );
  }
}
