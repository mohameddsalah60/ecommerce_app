import 'package:flutter/material.dart';

import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'signIn';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignInViewBody()),
    );
  }
}
