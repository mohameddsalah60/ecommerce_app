class UserEntity {
  final String name;
  final String phone;
  final String email;
  final String token;
  final num points, credit, id;
  String image;

  UserEntity({
    required this.name,
    required this.id,
    required this.phone,
    required this.email,
    required this.token,
    required this.points,
    required this.credit,
    required this.image,
  });
}
