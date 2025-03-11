import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/errors/failures.dart';
import '../entites/address_entity.dart';

abstract class AddressesRepo {
  Future<Either<Failure, LatLng>> getCurrentLocation();
  Future<Placemark> getAddressfromLocation({required LatLng position});
  Future<Either<Failure, AddressEntity>> addNewAddressUser(
      {required AddressEntity addressEntity});
  Future<Either<Failure, List<AddressEntity>>> getAddressesUser();
  Future<Either<Failure, AddressEntity>> updateAddressUser(
      {required AddressEntity address});
  Future<Either<Failure, void>> deleteAddressUser(
      {required AddressEntity address});
}
