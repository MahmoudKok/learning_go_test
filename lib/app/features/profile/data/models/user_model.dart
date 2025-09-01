import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends Equatable {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

  // New fields
  final String? companyName; // "Dooley, Kozey and Cronin"
  final String? title; // "Sales Manager"
  final Address? address;
  final String? ein; // "977-175"
  final String? ssn; // "900-590-289"
  final String? userAgent;
  final Crypto? crypto;
  final String? role; // "admin"

  const UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    this.companyName,
    this.title,
    this.address,
    this.ein,
    this.ssn,
    this.userAgent,
    this.crypto,
    this.role,
  });

  UserModel copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? companyName,
    String? title,
    Address? address,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      companyName: companyName ?? this.companyName,
      title: title ?? this.title,
      address: address ?? this.address,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    firstName,
    lastName,
    gender,
    image,
    companyName,
    title,
    address,
    ein,
    ssn,
    userAgent,
    crypto,
    role,
  ];
}

@JsonSerializable(explicitToJson: true)
class Address extends Equatable {
  final String? address;
  final String? city;
  final String? state;
  final String? stateCode;
  final String? postalCode;
  final Coordinates? coordinates;
  final String? country;

  const Address({
    this.address,
    this.city,
    this.state,
    this.stateCode,
    this.postalCode,
    this.coordinates,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [
    address,
    city,
    state,
    stateCode,
    postalCode,
    coordinates,
    country,
  ];
}

@JsonSerializable()
class Coordinates extends Equatable {
  final double? lat;
  final double? lng;

  const Coordinates({this.lat, this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);

  @override
  List<Object?> get props => [lat, lng];
}

@JsonSerializable()
class Crypto extends Equatable {
  final String? coin; // "Bitcoin"
  final String? wallet; // "0xb9fc..."
  final String? network; // "Ethereum (ERC20)"

  const Crypto({this.coin, this.wallet, this.network});

  factory Crypto.fromJson(Map<String, dynamic> json) => _$CryptoFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoToJson(this);

  @override
  List<Object?> get props => [coin, wallet, network];
}
