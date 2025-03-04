class AddressEntity {
  final String nameAddress, city, region, notes, details;
  final double latitude, longitude;
  int? id, phoneNumber, floor, apartment;
  AddressEntity({
    this.floor,
    this.apartment,
    required this.nameAddress,
    required this.city,
    required this.region,
    required this.notes,
    required this.details,
    required this.latitude,
    required this.longitude,
    this.id,
    this.phoneNumber,
  });
}
