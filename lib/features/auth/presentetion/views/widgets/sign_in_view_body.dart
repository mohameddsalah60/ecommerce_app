import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/service/api_service.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_password_field.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:flutter/material.dart';

import 'dont_have_an_account_widget.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 52,
        ),
        child: Form(
          key: fromKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: AppTextStyles.bold32,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Welcome back to Smart Shop',
                style: AppTextStyles.semiBold16.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Email Address',
                style: AppTextStyles.semiBold20,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFromField(
                hintText: 'hello@example.com',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Password',
                style: AppTextStyles.semiBold20,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomPasswordField(
                hintText: '***********',
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forget Password?',
                    style: AppTextStyles.semiBold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 37,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  AuthRepoImpl(
                          ecommerceApiService: EcommerceApiService(
                              apiService: ApiService(dio: Dio())))
                      .createUserWithEmailAndPassword(
                          'mohamedSa',
                          'mohamedsadasdasdaSa@gmail.com',
                          '1as1asd4asdada',
                          '01215564422');
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const DonthHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
