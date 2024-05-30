// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  final String id;
  final String name;
  final String email;
  final String? image; // Image can still be nullable
  final String? phoneNumber; // Phone number can still be nullable

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.image,
    this.phoneNumber,
  });
UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? image,
  }) {
     return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
  // Method to convert JSON to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '', // Provide a default value or handle the error
      name: json['name'] ?? 'No Name', // Provide a default value or handle the error
      email: json['email'] ?? 'No Email', // Provide a default value or handle the error
      image: json['image'],
      phoneNumber: json['phoneNumber'],
    );
  }

  // Method to convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'phoneNumber': phoneNumber,
    };
  }
}
























// class UserModel {
//   final String? id;
//   final String? name;
//   final String? email;
//   final String? image;
//   final String? phoneNumber;

//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//     this.image,
//     this.phoneNumber,
//   });

//   // Method to convert JSON to UserModel
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       image: json['image'],
//       phoneNumber: json['phoneNumber'],
//     );
//   }

//   // Method to convert UserModel to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'image': image,
//       'phoneNumber': phoneNumber,
//     };
//   }
// }
