import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

part 'get_current_location_state.dart';

class GetCurrentLocationCubit extends Cubit<GetCurrentLocationState> {
  GetCurrentLocationCubit(this.addressesRepo)
      : super(GetCurrentLocationInitial());
  final AddressesRepo addressesRepo;
  getCurrentLocation() async {
    emit(GetCurrentLocationLoading());
    var result = await addressesRepo.getCurrentLocation();
    result.fold(
      (failure) {
        emit(GetCurrentLocationFailure(message: failure.errorMessage));
      },
      (position) {
        emit(
          GetCurrentLocationSuccsess(
            letLong: LatLng(position.latitude, position.longitude),
          ),
        );
      },
    );
  }
}
