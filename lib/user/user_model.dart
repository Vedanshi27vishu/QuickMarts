import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  get photo => null;

  Map<String, dynamic> toJson() {
    //converting to json forn (machine language) giving to database
    return {
      "First": firstName,
      "Last": lastName,
      "Phone": phoneNumber,
      "Email": email,
      "Photo": profilePicture,
      "Username": id,
    };
  }

  Map<String, dynamic> toJson2(String field, String value) {
    return {field: value};
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        firstName: data["First"] ?? '',
        lastName: data["Last"] ?? '',
        phoneNumber: data["Phone"] ?? '',
        email: data["Email"] ?? '',
        profilePicture: data["Photo"] ?? '',
        username: data["Username"] ?? '');
  }
}
