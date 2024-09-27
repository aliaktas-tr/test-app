import 'package:new_weedus/export.dart';

class UploadProductModel {
  String? key,
      userID,
      userLicense,
      brandName,
      flowerName,
      flowerDescription,
      flowerImage,
      thc,
      cbd;
  String? price1g,
      price2g,
      price35g,
      price5g,
      price7g,
      price10g,
      price14g,
      price28g;
  String? price18oz, price14oz, price12oz, price1oz;
  bool? sativa, indica, hybrid, ounce, gram;
  UserModel? user;

  UploadProductModel(
      {this.key,
      this.userID,
      this.userLicense,
      this.brandName,
      this.flowerName,
      this.flowerDescription,
      this.flowerImage,
      this.thc,
      this.cbd,
      this.price1g,
      this.price2g,
      this.price35g,
      this.price5g,
      this.price7g,
      this.price10g,
      this.price14g,
      this.price28g,
      this.price18oz,
      this.price14oz,
      this.price12oz,
      this.price1oz,
      this.sativa,
      this.indica,
      this.hybrid,
      this.ounce,
      this.gram,this.user});

  toJson() {
    return {
      'userID': userID,
      "user": user == null ? null : user!.toJson(),
      'userLicense': userLicense,
      'brandName': brandName,
      'flowerName': flowerName,
      'flowerDescription': flowerDescription,
      'flowerImage': flowerImage,
      'thc': thc,
      'cbd': cbd,
      'price1g': price1g,
      'price2g': price2g,
      'price35g': price35g,
      'price5g': price5g,
      'price7g': price7g,
      'price10g': price10g,
      'price14g': price14g,
      'price28g': price28g,
      'price18oz': price18oz,
      'price14oz': price14oz,
      'price12oz': price12oz,
      'price1oz': price1oz,
      'sativa': sativa,
      'indica': indica,
      'hybrid': hybrid,
      'ounce': ounce,
      'gram': gram
    };
  }

  UploadProductModel.fromJson(Map<dynamic, dynamic> map) {
    key = map['key'];
    userID = map['userID'];
    user = UserModel.fromJson(map['user']);
    userLicense = map['userLicense'];
    brandName = map['brandName'];
    flowerName = map['flowerName'];
    flowerDescription = map['flowerDescription'];
    flowerImage = map['flowerImage'];
    thc = map['thc'];
    cbd = map['cbd'];
    price1g = map['price1g'];
    price2g = map['price2g'];
    price35g = map['price35g'];
    price5g = map['price5g'];
    price7g = map['price7g'];
    price10g = map['price10g'];
    price14g = map['price14g'];
    price28g = map['price28g'];
    price18oz = map['price18oz'];
    price14oz = map['price14oz'];
    price12oz = map['price12oz'];
    price1oz = map['price1oz'];
    sativa = map['sativa'];
    indica = map['indica'];
    hybrid = map['hybrid'];
    ounce = map['ounce'];
    gram = map['gram'];
  }
}
