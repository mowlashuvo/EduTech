import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool? status;
  final String? message;
  final LoginDataEntity? data;
  final int? total;

  const LoginEntity({
    this.status,
    this.message,
    this.data,
    this.total,
  });

  @override
  List<Object?> get props => [status, message, data, total];
}

class LoginDataEntity extends Equatable {
  final String? token;
  final UserEntity? user;

  const LoginDataEntity({
    this.token,
    this.user,
  });

  @override
  List<Object?> get props => [token, user];
}

class UserEntity extends Equatable {
  final int? id;
  final String? roleId;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final dynamic mobile;
  final dynamic phone;
  final dynamic cityId;
  final dynamic countryId;
  final dynamic stateId;
  final dynamic image;
  final dynamic website;
  final int? status;
  final String? applyVender;
  final dynamic gender;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isVerified;
  final dynamic braintreeId;
  final dynamic deletedAt;
  final dynamic phonecode;
  final dynamic google2FaSecret;
  final int? google2FaEnable;
  final dynamic referCode;
  final dynamic referedFrom;
  final dynamic socialId;
  final String? roleName;
  final String? currentRole;

  const UserEntity({
    this.id,
    this.roleId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.mobile,
    this.phone,
    this.cityId,
    this.countryId,
    this.stateId,
    this.image,
    this.website,
    this.status,
    this.applyVender,
    this.gender,
    this.createdAt,
    this.updatedAt,
    this.isVerified,
    this.braintreeId,
    this.deletedAt,
    this.phonecode,
    this.google2FaSecret,
    this.google2FaEnable,
    this.referCode,
    this.referedFrom,
    this.socialId,
    this.roleName,
    this.currentRole,
  });

  @override
  List<Object?> get props => [
    id,
    roleId,
    name,
    email,
    emailVerifiedAt,
    mobile,
    phone,
    cityId,
    countryId,
    stateId,
    image,
    website,
    status,
    applyVender,
    gender,
    createdAt,
    updatedAt,
    isVerified,
    braintreeId,
    deletedAt,
    phonecode,
    google2FaSecret,
    google2FaEnable,
    referCode,
    referedFrom,
    socialId,
    roleName,
    currentRole,
  ];
}
