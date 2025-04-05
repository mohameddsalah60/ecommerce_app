import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../cubits/my_account_cubit/my_account_cubit.dart';

class PersonalInformationFildes extends StatelessWidget {
  const PersonalInformationFildes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Personal Information',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFromField(
          hintText: getUser().name,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().nameFieldController.text = value;
            }
          },
          controller: context.read<MyAccountCubit>().nameFieldController,
          suffixIcon: const Icon(Icons.edit),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFromField(
          controller: context.read<MyAccountCubit>().emailFieldController,
          hintText: getUser().email,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().emailFieldController.text = value;
            }
          },
          suffixIcon: const Icon(Icons.edit),
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextFromField(
          controller: context.read<MyAccountCubit>().phoneFieldController,
          hintText: getUser().phone,
          onSaved: (value) {
            if (value != null) {
              context.read<MyAccountCubit>().phoneFieldController.text = value;
            }
          },
          suffixIcon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
