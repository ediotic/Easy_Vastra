class UserModels {
  final String uId;
  final String userName;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;

  UserModels({
    required this.uId,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActive,
    required this.createdOn,
  });

  /// Serialize the userModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
    };
  }

  /// Create a userModel instance from a JSON map
  factory UserModels.fromMap(Map<String, dynamic> json) {
    return UserModels(
      uId: json['uId'],
      userName: json['userName'],
      email: json['email'],
      phone: json['phone'],
      userImg: json['userImg'],
      userDeviceToken: json['userDeviceToken'],
      country: json['country'],
      userAddress: json['userAddress'],
      street: json['street'],
      isAdmin: json['isAdmin'],
      isActive: json['isActive'],
      createdOn: json['createdOn'].toString(),
    );
  }
}
