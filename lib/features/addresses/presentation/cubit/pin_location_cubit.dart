import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';

part 'pin_location_state.dart';

class PinLocationCubit extends Cubit<PinLocationState> {
  PinLocationCubit(this.addressesRepo) : super(PinLocationInitial());
  final AddressesRepo addressesRepo;
  getCurrentLocation() async {
    emit(PinLocationLoading());
    var result = await addressesRepo.getCurrentLocation();
    result.fold(
      (failure) {
        emit(PinLocationFailure(message: failure.errorMessage));
      },
      (position) {
        emit(
          PinLocationSuccsess(
            letLong: LatLng(position.latitude, position.longitude),
          ),
        );
      },
    );
  }

  updatePinLocation(LatLng pos) {
    emit(
      PinLocationSuccsess(
        letLong: LatLng(pos.latitude, pos.longitude),
      ),
    );
  }
}
