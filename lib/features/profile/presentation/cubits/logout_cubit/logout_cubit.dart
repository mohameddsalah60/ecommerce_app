import 'package:ecommerce_app/features/profile/domin/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.profileRepo) : super(LogoutInitial());
  final ProfileRepo profileRepo;
  Future<void> logoutUser() async {
    emit(LogoutLoading());
    var result = await profileRepo.logoutUser();
    result.fold(
      (failure) => emit(LogoutFailure(msg: failure.errorMessage)),
      (success) => emit(LogoutSuccess()),
    );
  }
}
