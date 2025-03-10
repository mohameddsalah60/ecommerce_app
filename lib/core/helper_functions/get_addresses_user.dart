import 'dart:convert';

import 'package:ecommerce_app/core/service/shared_preferences_service.dart';
import 'package:ecommerce_app/features/addresses/data/models/address_model.dart';
import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

List<AddressEntity> getAddresses() {
  var jsonData = SharedPreferencesService.getData(key: 'addresses') ?? [];
  List<AddressEntity> saveAddressData =[ ];
  for (var address in jsonData) {
    var addressesEntity = AddressModel.fromJson(jsonDecode(address));
    saveAddressData.add(addressesEntity);
  }

  return saveAddressData;
}
