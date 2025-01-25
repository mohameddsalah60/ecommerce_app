import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/addresses/data/services/open_street_map_service.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class AddressesRepoImpl implements AddressesRepo {
  final OpenStreetMapService openStreetMapService;

  AddressesRepoImpl({required this.openStreetMapService});

  @override
  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    try {
      bool isEnabled = await openStreetMapService.checkPermission();

      if (isEnabled) {
        LatLng positionUser = await openStreetMapService.getCurrentLocation();
        return right(positionUser);
      } else {
        return left(PermissionFailure(
            "🚫 Location permission is required. Please enable it."));
      }
    } on PermissionDeniedException {
      return left(PermissionFailure(
          "Location permission denied. Please grant permission."));
    } on LocationServiceDisabledException catch (e) {
      return left(
          LocationServiceFailure("Location services are ${e.toString()}"));
    } on CustomException catch (e) {
      return left(
          LocationServiceFailure("Location services are ${e.toString()}"));
    } catch (e) {
      log("Exception in AddressesRepoImpl: ${e.toString()}");
      return left(LocationServiceFailure(
          "An unexpected error occurred while fetching the location."));
    }
  }
}
