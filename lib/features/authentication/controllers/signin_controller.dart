import 'package:ecommerce/Navigation.dart';
import 'package:ecommerce/features/authentication/models/Category_model.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInController {
  static final email = TextEditingController();
  static final password = TextEditingController();
  static Future<void> SignIn(UserModel usermodel, String email, String password,
      BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((Value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => NavigationMenu(
                        usermodel: usermodel,
                      ))));
      throw "Successfully LoggedIn !";
    } on FirebaseAuthException {
      throw "Something Went wrong";
    } catch (e) {
      throw ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Sucessful !")));
    }
  }
}
