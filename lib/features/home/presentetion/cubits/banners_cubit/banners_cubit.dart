import 'package:ecommerce_app/features/home/domin/entites/banners_entity.dart';
import 'package:ecommerce_app/features/home/domin/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepo) : super(BannersInitial());
  final HomeRepo homeRepo;
  Future<void> getBanners() async {
    emit(BannersLoading());
    var result = await homeRepo.getBanners();
    result.fold(
      (failure) {
        emit(BannersFailure(message: failure.errorMessage));
      },
      (banners) {
        emit(BannersSuccsess(banners: banners));
      },
    );
  }
}
