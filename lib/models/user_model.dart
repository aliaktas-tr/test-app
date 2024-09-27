class UserModel {
  String? key,
      userID,
      email,
      displayName,
      userName,
      phoneNumber,
      profileImage,
      location,
      address,
      createdAt,
      dob,
      fcmToken,
      mmjID,
      mmjIssuedOn,
      mmjExpiresOn,
      license;
  bool? isLicenseVerified,
      isUserVerified,
      isMedUser,
      isDispensaryVerified,
      isVerified,
      isPhoneVerified;

  UserModel(
      {this.key,
      this.userID,
      this.email,
      this.displayName,
      this.userName,
      this.phoneNumber,
      this.profileImage,
      this.location,
      this.address,
      this.createdAt,
      this.dob,
      this.fcmToken,
      this.isMedUser,
      this.mmjID,
      this.mmjIssuedOn,
      this.mmjExpiresOn,
      this.isUserVerified,
      this.license,
      this.isLicenseVerified,
      this.isDispensaryVerified,
      this.isVerified,
      this.isPhoneVerified});

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null) {
      return;
    }
    key = map['key'];
    userID = map['userID'];
    email = map['email'];
    displayName = map['displayName'];
    userName = map['userName'];
    phoneNumber = map['phoneNumber'];
    profileImage = map['profileImage'];
    location = map['location'];
    address = map['address'];
    createdAt = map['createdAt'];
    dob = map['dob'];
    fcmToken = map['fcmToken'];
    isMedUser = map['isMedUser'];
    mmjID = map['mmjID'];
    mmjIssuedOn = map['mmjIssuedOn'];
    mmjExpiresOn = map['mmjExpiresOn'];
    isUserVerified = map['isUserVerified'];
    license = map['license'];
    isLicenseVerified = map['isLicenseVerified'];
    isDispensaryVerified = map['isDispensaryVerified'];
    isVerified = map['isVerified'];
    isPhoneVerified = map['isPhoneVerified'];
  }

  toJson() {
    return {
      "key": key,
      "userID": userID,
      "email": email,
      "displayName": displayName,
      "userName": userName,
      "phoneNumber": phoneNumber,
      "profileImage": profileImage,
      "location": location,
      "address": address,
      "createdAt": createdAt = DateTime.now().toString(),
      "dob": dob,
      'fcmToken': fcmToken,
      "isMedUser": isMedUser ?? false,
      "mmjID": mmjID,
      "mmjIssuedOn": mmjIssuedOn,
      "mmjExpiresOn": mmjExpiresOn,
      'isUserVerified': isUserVerified ?? false,
      'license': license,
      'isLicenseVerified': isLicenseVerified ?? false,
      'isDispensaryVerified': isDispensaryVerified ?? false,
      'isVerified': isVerified ?? false,
      'isPhoneVerified': isPhoneVerified ?? false
    };
  }

  UserModel copyWith(
      {String? key,
      userID,
      email,
      displayName,
      userName,
      phoneNumber,
      profileImage,
      location,
      address,
      createdAt,
      dob,
      fcmToken,
      mmjID,
      mmjIssuedOn,
      mmjExpiresOn,
      license,
      bool? isLicenseVerified,
      isUserVerified,
      isMedUser,
      isDispensaryVerified,
      isVerified,
      isPhoneVerified}) {
    return UserModel(
        key: key ?? this.key,
        userID: userID ?? this.userID,
        email: email ?? this.email,
        displayName: displayName ?? this.displayName,
        userName: userName ?? this.userName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        profileImage: profileImage ?? this.profileImage,
        location: location ?? this.location,
        address: address ?? this.address,
        createdAt: createdAt ?? this.createdAt,
        dob: dob ?? this.dob,
        fcmToken: fcmToken ?? this.fcmToken,
        mmjID: mmjID ?? this.mmjID,
        mmjIssuedOn: mmjIssuedOn ?? this.mmjIssuedOn,
        mmjExpiresOn: mmjExpiresOn ?? this.mmjExpiresOn,
        license: license ?? this.license,
        isLicenseVerified: isLicenseVerified ?? this.isLicenseVerified,
        isUserVerified: isUserVerified ?? this.isUserVerified,
        isMedUser: isMedUser ?? this.isMedUser,
        isDispensaryVerified: isDispensaryVerified ?? this.isDispensaryVerified,
        isVerified: isVerified ?? this.isVerified);
  }
}
