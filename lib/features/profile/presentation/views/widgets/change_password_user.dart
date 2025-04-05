import 'package:ecommerce_app/features/profile/presentation/cubits/my_account_cubit/my_account_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_password_field.dart';

class ChangePasswordUser extends StatelessWidget {
  const ChangePasswordUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Change Password',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomPasswordField(
          textEditingController:
              context.read<MyAccountCubit>().curruntPassFieldController,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().curruntPassFieldController.text =
                  value;
            }
          },
          hintText: 'Currunt Password',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomPasswordField(
          textEditingController:
              context.read<MyAccountCubit>().newPassFieldController,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().newPassFieldController.text =
                  value;
            }
          },
          hintText: 'New Password',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomPasswordField(
          textEditingController:
              context.read<MyAccountCubit>().confirmPassFieldController,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().confirmPassFieldController.text =
                  value;
            }
          },
          hintText: 'Confirm new password',
        ),
      ],
    );
  }
}
