import 'package:feature_toggle_flutter/app/api/model/organizationDto.dart';

class UserDto {
  late final String firstName;
  late final String lastName;
  late final String userName;
  late final String? email;
  late final String employeeId;
  late final String? department;
  late final Roles userRole;
  late final List<OrganizationDto>? organizations;

  UserDto({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.employeeId,
    required this.department,
    required this.userRole,
    required this.organizations,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    List<OrganizationDto> tempOrg = List.empty(growable: true);
    for (var i in json['organizations']) {
      tempOrg.add(OrganizationDto.fromJson(i));
    }
    return UserDto(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      email: json['email'],
      employeeId: json['employeeId'],
      department: json['department'],
      userRole: Roles.values.byName(json['userRole']),
      organizations: tempOrg,
    );
  }
}

enum Roles {
  ROLE_ADMIN,
  ROLE_BUSINESS_ADMIN,
  ROLE_BUSINESS_USER,
}
