import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CloudFireStore{
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth us = FirebaseAuth.instance;
  Future<void> setUserData({
    required String imgUrl,
    required String email,
    required int age,
    required String name,
}) async{
    return users
        .doc(us.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
      'imgUrl': imgUrl,
      'age': age
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));

  }



}