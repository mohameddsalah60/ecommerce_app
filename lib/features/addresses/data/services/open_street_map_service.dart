import 'dart:async';
import 'dart:developer';

import 'package:ecommerce_app/core/errors/exceptions.dart';
import 'package:ecommerce_app/features/addresses/data/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class OpenStreetMapService implements LocationService {
  @override
  Future<bool> checkPermission() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw CustomException(
            message:
                "🚫 Location permission is permanently denied. Enable it from settings.");
      }
      return true;
    } catch (e) {
      log("❌ Exception in checkPermission: ${e.toString()}");
      throw CustomException(message: "⚠️ Error checking location permissions.");
    }
  }

  @override
  Future<LatLng> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition()
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            "⏳ Location request timed out. Please try again.");
      });

      return LatLng(position.latitude, position.longitude);
    } on PermissionDeniedException {
      throw CustomException(message: "🚫 Location permission is required.");
    } on LocationServiceDisabledException {
      throw CustomException(
          message: "⚠️ Location services are disabled. Please enable GPS.");
    } catch (e) {
      log("❌ Exception in OpenStreetMapService: ${e.toString()}");
      throw CustomException(
          message:
              "⚠️ An unexpected error occurred while fetching the location.");
    }
  }
}
