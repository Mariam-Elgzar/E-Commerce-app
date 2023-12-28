import 'package:flutter/material.dart';

class Users{
  double? weight;
  double? height;
  String gender;
  String name;
  String email;
  String? imgUrl;
  String uid;
  int age;

  Users({
    this.weight,
    this.height,
    required this.gender,
    required this.name,
    required this.email,
    required this.age,
    this.imgUrl,
    required this.uid,
  });


}