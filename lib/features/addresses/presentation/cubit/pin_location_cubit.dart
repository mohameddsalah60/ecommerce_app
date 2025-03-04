import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../../domain/entites/address_entity.dart';

part 'pin_location_state.dart';

class PinLocationCubit extends Cubit<PinLocationState> {
  String address = '';
  AddressEntity? addressEntity;
  PinLocationCubit(this.addressesRepo) : super(PinLocationInitial());
  final AddressesRepo addressesRepo;
  getCurrentLocation() async {
    emit(PinLocationLoading());
    var result = await addressesRepo.getCurrentLocation();
    result.fold(
      (failure) {
        emit(PinLocationFailure(message: failure.errorMessage));
      },
      (position) async {
        await getAddressformLocation(position: position);
        emit(
          PinLocationSuccsess(
            letLong: LatLng(position.latitude, position.longitude),
          ),
        );
      },
    );
  }

  updatePinLocation(LatLng pos) async {
    await getAddressformLocation(position: pos);
    emit(
      PinLocationSuccsess(
        letLong: LatLng(pos.latitude, pos.longitude),
      ),
    );
  }

  getAddressformLocation({required LatLng position}) async {
    Placemark placemark =
        await addressesRepo.getAddressfromLocation(position: position);
    address =
        "${placemark.street},${placemark.locality}, ${placemark.administrativeArea}";
    addressEntity = AddressEntity(
      nameAddress: '',
      city: placemark.administrativeArea!,
      region: placemark.locality!,
      notes: '',
      details: placemark.street!,
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
