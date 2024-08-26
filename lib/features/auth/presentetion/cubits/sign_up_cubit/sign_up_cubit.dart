import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo;
  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String phone,
    String name,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
      phone,
    );
    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessages: failure.errorMessage));
      },
      (userEntite) {
        emit(SignUpSuccsess(userEntite: userEntite));
      },
    );
  }
}
