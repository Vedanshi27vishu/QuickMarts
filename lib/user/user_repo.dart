import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/screens/loginscreen.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserRepository {
  static final _db = FirebaseFirestore.instance;

  // Function to create a user in Firestore
  static Future<void> createUser(UserModel user, BuildContext context) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Authentication Error")));
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Firebase Error")));
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message ?? "Platform Error")));
    } on FormatException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An unknown error occurred: $e")));
    }
  }

  static Future<UserModel?> getuseremail(String email) async {
    try {
      final data =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (data.docs.isNotEmpty) {
        return UserModel.fromSnapshot(data.docs[0]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> getUserDetail(String email) async {
    try {
      final snapshot =
          await _db.collection("Users").where("Email", isEqualTo: email).get();
      if (snapshot.docs.isNotEmpty) {
        return UserModel.fromSnapshot(snapshot.docs[0]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<UserModel?> getuserData() async {
    try {
      final email = FirebaseAuth.instance.currentUser?.email;
      if (email != null) {
        return await UserRepository.getuseremail(email);
      } else {
        throw " No authenticated user found!";
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<void> updateUserRecord(
      UserModel user, String field, String value) async {
    await _db
        .collection("Users")
        .doc(user.id)
        .update(user.toJson2(field, value));
  }

  static Future<void> deleteuserRecord(UserModel user, context) async {
    try {
      User? currentuser = FirebaseAuth.instance.currentUser;
      await _db.collection("Users").doc(user.id).delete();
      await currentuser!.delete().then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          ));
      print("success");
    } catch (e) {
      print("unsuccessful");
    }
  }
  
}
