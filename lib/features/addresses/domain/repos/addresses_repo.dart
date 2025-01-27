import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/errors/failures.dart';

abstract class AddressesRepo {
  Future<Either<Failure, LatLng>> getCurrentLocation();
  Future<Placemark> getAddressfromLocation({required LatLng position});
}
