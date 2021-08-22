import 'package:flutter/foundation.dart';

class UserModel {
  String id;
  String email;
  String fName;
  String lName;
  String city;
  String country;
  UserModel({
    @required this.id,
    @required this.email,
    @required this.fName,
    @required this.lName,
    @required this.city,
    @required this.country,
  });

  UserModel.fromMap(Map map){
    this.id = map['id'];
    this.email = map['email'];
    this.fName = map['fName'];
    this.lName = map['lName'];
    this.city = map['city'];
    this.country = map['country'];
  }
}

