import 'package:ecommerce_app/features/addresses/domain/entites/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.nameAddress,
    required super.city,
    required super.region,
    required super.notes,
    required super.details,
    required super.latitude,
    required super.longitude,
    super.id,
    super.apartment,
    super.floor,
    super.phoneNumber,
  });
  factory AddressModel.fromJson(Map<String, dynamic> data) {
    return AddressModel(
      nameAddress: data['name'],
      city: data["city"],
      region: data['region'],
      notes: data['notes'],
      details: data['details'],
      latitude: data['latitude'],
      longitude: data['longitude'],
    );
  }
}
