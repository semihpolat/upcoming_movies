import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String profilePicture;

  UserModel({this.id, this.name, this.email, this.profilePicture});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.data()['id'];
    name = documentSnapshot.data()['name'];
    email = documentSnapshot.data()['email'];
    profilePicture = documentSnapshot.data()['profile_picture'];
  }
}
