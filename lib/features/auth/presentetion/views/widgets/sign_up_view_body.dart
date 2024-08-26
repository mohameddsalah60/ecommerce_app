import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/custom_password_field.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/features/auth/presentetion/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/widgets/have_an_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'terms_and_condition_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName, email, password, phone;
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
                'Register',
                style: AppTextStyles.bold32,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Create your new account',
                style: AppTextStyles.semiBold16.copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Name',
                style: AppTextStyles.semiBold20,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFromField(
                hintText: 'your name',
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  userName = value!;
                },
              ),
              const SizedBox(
                height: 16,
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
                'Phone',
                style: AppTextStyles.semiBold20,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextFromField(
                hintText: 'your phone',
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  phone = value!;
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
              const TermsAndConditionWidget(),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                text: 'Register',
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();

                    context.read<SignUpCubit>().createUserWithEmailAndPassword(
                          email,
                          password,
                          userName,
                          phone,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
