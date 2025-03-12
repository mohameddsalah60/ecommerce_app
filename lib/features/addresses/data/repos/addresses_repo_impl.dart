import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/constantis.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/helper_functions/get_addresses_user.dart';
import 'package:ecommerce_app/core/service/ecommerce_api_service.dart';
import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/addresses/data/services/location_service.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';
import 'package:ecommerce_app/features/addresses/domain/repos/addresses_repo.dart';
import 'package:ecommerce_app/features/home/presentetion/views/widgets/address_user_home_view.dart';
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
  List<AddressEntity> savedAddresses = [];
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
      if (await canAddNewAddress()) {
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
          savedAddresses.add(addressEntity);
          return right(addressEntity);
        }
      } else {
        throw CustomException(message: "You cannot add more than 3 addresses.");
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

  Future<bool> canAddNewAddress() async {
    return savedAddresses.length < 3;
  }

  Future<bool> isExists(AddressEntity addressEntity) async {
    return savedAddresses
        .any((savedAddress) => savedAddress.id == addressEntity.id);
  }

  @override
  Future<Either<Failure, List<AddressEntity>>> getAddressesUser() async {
    try {
      if (savedAddresses.isEmpty) {
        var response = await ecommerceApiService.getAddressesUser();

        if (response['status'] == false) {
          throw CustomException(message: response['message']);
        } else {
          for (var address in response['data']['data']) {
            AddressEntity addressEntity = AddressModel.fromJson(address);

            if (!await isExists(addressEntity)) {
              savedAddresses.add(addressEntity);
            }
          }
        }
      }
      return right(savedAddresses);
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

  @override
  Future<Either<Failure, AddressEntity>> updateAddressUser(
      {required AddressEntity address}) async {
    try {
      var response =
          await ecommerceApiService.updateAddressUser(address: address);

      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        AddressEntity addressEntity = AddressModel.fromJson(response['data']);
        if (await isExists(address)) {
          for (int i = 0; i < savedAddresses.length; i++) {
            if (savedAddresses[i].id == address.id) {
              savedAddresses[i] = AddressEntity(
                id: savedAddresses[i].id,
                nameAddress: address.nameAddress,
                city: address.city,
                region: address.region,
                details: address.details,
                latitude: address.latitude,
                longitude: address.longitude,
                notes: address.notes,
              );
              break;
            }
          }

          if (getAddresses().id == address.id) {
            await setAddressDefault(address: address);

            addressNotifier.value = address.nameAddress;
          }
        }

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

  @override
  Future<Either<Failure, void>> deleteAddressUser(
      {required AddressEntity address}) async {
    try {
      var response =
          await ecommerceApiService.deleteAddressUser(id: address.id!);

      if (response['status'] == false) {
        throw CustomException(message: response['message']);
      } else {
        if (await isExists(address)) {
          savedAddresses.remove(address);
          await SharedPreferencesService.removeData(key: kAddressUserCache);
          addressNotifier.value = getAddresses().nameAddress;
        }
        return right(null);
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

  @override
  Future<void> setAddressDefault({required AddressEntity address}) async {
    AddressEntity myAddress = getAddresses();
    var jsonData =
        jsonEncode(AddressModel.fromEntity(addressEntity: address).toMap());

    if (myAddress.id != address.id ||
        myAddress.nameAddress != address.nameAddress) {
      await SharedPreferencesService.saveData(
        key: kAddressUserCache,
        value: jsonData,
      );
    }
  }
}
