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
      id: data['id'],
    );
  }
  factory AddressModel.fromEntity({required AddressEntity addressEntity}) {
    return AddressModel(
      nameAddress: addressEntity.nameAddress,
      city: addressEntity.city,
      region: addressEntity.region,
      notes: addressEntity.notes,
      details: addressEntity.details,
      latitude: addressEntity.latitude,
      longitude: addressEntity.longitude,
      id: addressEntity.id,
    );
  }
  toMap() {
    return {
      'name': nameAddress,
      'city': city,
      'region': region,
      'details': details,
      'notes': notes,
      'latitude': latitude,
      'longitude': longitude,
      'id': id,
    };
  }
}
