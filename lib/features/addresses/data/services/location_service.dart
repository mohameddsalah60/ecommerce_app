import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

abstract class LocationService {
  Future<bool> checkPermission();
  Future<LatLng> getCurrentLocation();
  Future<Placemark> getAddressformLocation({required LatLng position});
}
