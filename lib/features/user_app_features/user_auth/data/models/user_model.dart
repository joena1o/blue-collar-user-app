class UserModel {
  String? id;
  String email;
  String firstName;
  String lastName;
  String password;
  String? picture;
  String referralCode;
  String privileges;
  Profile profile;
  int? version;

  UserModel({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.picture,
    required this.referralCode,
    required this.privileges,
    required this.profile,
    this.version,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      password: json['password'],
      picture: json['picture'],
      referralCode: json['referralCode'],
      privileges: json['privileges'],
      profile: Profile.fromJson(json['profile']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'picture': picture,
      'referralCode': referralCode,
      'privileges': privileges,
      'profile': profile.toJson(),
      '__v': version,
    };
  }
}

class Profile {
  String? address;
  String? dateOfBirth;
  String? bio;
  String? phone;

  Profile({
    this.address,
    this.dateOfBirth,
    this.bio,
    this.phone,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      address: json['address'],
      dateOfBirth: json['dateOfBirth'],
      bio: json['bio'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'dateOfBirth': dateOfBirth,
      'bio': bio,
      'phone': phone,
    };
  }
}
