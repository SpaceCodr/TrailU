//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  String? email;
  String? password;

  UserModel({required this.uid,this.email,this.password});
}