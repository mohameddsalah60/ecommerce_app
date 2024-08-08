import 'package:ecommerce_app/core/utils/app_styles.dart';
import 'package:ecommerce_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:ecommerce_app/features/splash/presentation/cubits/loacle_cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> selectLanguageBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    builder: (context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .12,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInView.routeName);
                context.read<LocaleCubit>().setLocale('en');
              },
              child: Text(
                'English',
                style: AppStyles.bold19,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInView.routeName);
                context.read<LocaleCubit>().setLocale('ar');
              },
              child: Text(
                'العربية',
                style: AppStyles.bold19,
              ),
            ),
          ],
        ),
      );
    },
  );
}
