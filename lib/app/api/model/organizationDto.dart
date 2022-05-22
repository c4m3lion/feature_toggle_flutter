import 'package:feature_toggle_flutter/app/api/model/userDto.dart';

class OrganizationDto {
  final String id;
  final String name;
  final Roles role;
  //TODO: add space array

  OrganizationDto({
    required this.id,
    required this.name,
    required this.role,
  });

  factory OrganizationDto.fromJson(Map<String, dynamic> json) {
    print(json['name']);
    return OrganizationDto(
      id: json['id'],
      name: json['name'],
      role: Roles.values.byName(json['role']),
    );
  }
}
