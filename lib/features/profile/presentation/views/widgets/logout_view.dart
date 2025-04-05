import 'package:ecommerce_app/core/helper_functions/custom_snack_bar.dart';
import 'package:ecommerce_app/core/service/get_it_service.dart';
import 'package:ecommerce_app/core/utils/app_text_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_loading_indicator.dart';
import 'package:ecommerce_app/features/auth/presentetion/views/sign_in_view.dart';
import 'package:ecommerce_app/features/profile/domin/profile_repo.dart';
import 'package:ecommerce_app/features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => LogoutCubit(getIt<ProfileRepo>()),
      child: const LogoutConfirmationBlocConsumer(),
    ),
  );
}

class LogoutConfirmationBlocConsumer extends StatelessWidget {
  const LogoutConfirmationBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutFailure) {
          customSnackBar(context, text: state.msg);
        } else if (state is LogoutSuccess) {
          Navigator.pushReplacementNamed(context, SignInView.routeName);
        }
      },
      builder: (context, state) {
        return state is LogoutLoading
            ? AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                title: const CustomLoadingIndicator(),
              )
            : AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                title: const Text(
                  'Are you sure you want to log out? 😔',
                  style: AppTextStyles.bold16,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(), // No
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<LogoutCubit>().logoutUser();
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
      },
    );
  }
}
