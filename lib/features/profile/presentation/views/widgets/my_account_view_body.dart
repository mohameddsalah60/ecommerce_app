import 'package:ecommerce_app/features/profile/presentation/cubits/my_account_cubit/my_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'change_password_user.dart';
import 'personal_information_fildes.dart';

class MyAccountViewBody extends StatelessWidget {
  const MyAccountViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const PersonalInformationFildes(),
            const SizedBox(
              height: 24,
            ),
            const ChangePasswordUser(),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<MyAccountCubit, MyAccountState>(
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is MyAccountLoading ? true : false,
                  text: 'Save Changes',
                  onPressed: () async => state is MyAccountLoading
                      ? null
                      : await context.read<MyAccountCubit>().saveChanges(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
