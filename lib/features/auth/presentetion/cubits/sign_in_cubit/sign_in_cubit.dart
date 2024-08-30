import 'package:ecommerce_app/features/auth/domain/entites/user_entite.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(SignInLoading());
    final result = await authRepo.loginUserWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) {
        emit(SignInFailure(errorMessages: failure.errorMessage));
      },
      (userEntite) {
        emit(SignInSuccsess(userEntite: userEntite));
      },
    );
  }
}
