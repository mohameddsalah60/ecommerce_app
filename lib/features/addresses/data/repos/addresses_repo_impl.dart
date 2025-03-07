import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/addresses/data/services/location_service.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class AddressesRepoImpl extends AddressesRepo {
  final LocationService locationService;
  final EcommerceApiService ecommerceApiService;
  AddressesRepoImpl({
    required this.ecommerceApiService,
    required this.locationService,
  });

  @override
  Future<Either<Failure, LatLng>> getCurrentLocation() async {
    try {
      bool isEnabled = await locationService.checkPermission();

      if (isEnabled) {
        LatLng positionUser = await locationService.getCurrentLocation();
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

  @override
  Future<Placemark> getAddressfromLocation({required LatLng position}) async {
    Placemark place =
        await locationService.getAddressformLocation(position: position);
    return place;
  }

  @override
  Future<Either<Failure, AddressEntity>> addNewAddressUser(
      {required AddressEntity addressEntity}) async {
    try {
      var response = await ecommerceApiService.addNewAddressUser(
        name: addressEntity.nameAddress,
        city: addressEntity.city,
        region: addressEntity.region,
        details: addressEntity.details,
        notes: addressEntity.notes,
        latitude: addressEntity.latitude,
        longitude: addressEntity.longitude,
      );
      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        AddressEntity addressEntity = AddressModel.fromJson(response['data']);
        return right(addressEntity);
      }
    } on DioException catch (e) {
      log('DioException in AddressesRepo : ${e.toString()}');
      return left(ServerFailure.fromDioError(e));
    } on CustomException catch (e) {
      log('CustomException in AddressesRepo : ${e.toString()}');

      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl: ${e.toString()}');
      return left(ServerFailure('Oops There was an error, try again!'));
    }
  }
}
