import 'package:ecommerce_app/core/helper_functions/get_user.dart';
import 'package:ecommerce_app/features/profile/domin/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit(this.profileRepo) : super(MyAccountInitial());
  final ProfileRepo profileRepo;

  final TextEditingController nameFieldController =
      TextEditingController(text: getUser().name);
  final TextEditingController emailFieldController =
      TextEditingController(text: getUser().email);
  final TextEditingController phoneFieldController =
      TextEditingController(text: getUser().phone);
  final TextEditingController curruntPassFieldController =
      TextEditingController();
  final TextEditingController newPassFieldController = TextEditingController();
  final TextEditingController confirmPassFieldController =
      TextEditingController();

  Future<void> saveChanges() async {
    emit(MyAccountLoading());
    if (hasChangesPersonalInformation()) {
      var result = await profileRepo.personalInformationUpdate(
        name: nameFieldController.text,
        email: emailFieldController.text,
        phone: phoneFieldController.text,
      );
      result.fold(
        (failure) => emit(MyAccountFailure(message: failure.errorMessage)),
        (success) => emit(MyAccountSuccess()),
      );
    } else {
      validatePasswordFields();
    }
  }

  void validatePasswordFields() async {
    if (curruntPassFieldController.text.isNotEmpty ||
        newPassFieldController.text.isNotEmpty ||
        confirmPassFieldController.text.isNotEmpty) {
      if (curruntPassFieldController.text.isEmpty) {
        emit(MyAccountFailure(message: 'Current password is empty'));
      } else if (newPassFieldController.text.isEmpty ||
          confirmPassFieldController.text.isEmpty) {
        emit(MyAccountFailure(message: 'New or confirm password is empty'));
      } else if (newPassFieldController.text !=
          confirmPassFieldController.text) {
        emit(MyAccountFailure(message: 'Passwords do not match'));
      } else {
        var result = await profileRepo.changePassword(
            currentPassword: curruntPassFieldController.text,
            newPassword: newPassFieldController.text);
        result.fold(
          (failure) => emit(MyAccountFailure(message: failure.errorMessage)),
          (success) {
            curruntPassFieldController.clear();
            newPassFieldController.clear();
            confirmPassFieldController.clear();
            emit(MyAccountSuccess());
          },
        );
      }
    }
  }

  bool hasChangesPersonalInformation() {
    if (nameFieldController.text != getUser().name ||
        emailFieldController.text != getUser().email ||
        phoneFieldController.text != getUser().phone) {
      return true;
    }
    return false;
  }
}
