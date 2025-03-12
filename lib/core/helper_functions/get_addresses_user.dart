import 'dart:convert';

import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

AddressEntity getAddresses() {
  var jsonData = SharedPreferencesService.getData(key: 'myAddress');

  if (jsonData == null || jsonData.isEmpty) {
    return AddressEntity(
      id: null,
      nameAddress: 'Not available address yet',
      city: '',
      region: '',
      details: '',
      notes: '',
      latitude: 0.0,
      longitude: 0.0,
    );
  }
  var addressesEntity = AddressModel.fromJson(jsonDecode(jsonData));
  return addressesEntity;
}
