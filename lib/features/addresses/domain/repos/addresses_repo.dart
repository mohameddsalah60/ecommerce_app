import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';

import '../../../../core/errors/failures.dart';

abstract class AddressesRepo {
  Future<Either<Failure, LatLng>> getCurrentLocation();
}
