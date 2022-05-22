import 'dart:developer' as dev;

import 'package:e_nosa/models/userModel.dart';
import 'package:e_nosa/views/home_view.dart';
import 'package:e_nosa/views/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModle extends GetxController {
  // final Rx<User> _user = Rx<User>();

  // final User _user = User();

  // String get user => _user.value.email!;

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var email, password, name;
  @override
  void onInit() {
    // user.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    dev.log(userCredential.user.toString(), name: "user_credential");
  }

  final gStorage = GetStorage();

  void signWithEmailPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user!.email!.isNotEmpty) {
          gStorage.write('is_login', value.user!.email!);
          Get.snackbar("Success", "Successfully loged in.");
        } else {
          Get.snackbar("Failed", "Failed to login.");
        }

        Get.to(HomeView());
      });
    } catch (e) {
      print(e);
      Get.snackbar(
        "signInError",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.grey,
      );
    }
  }

  ////create account function

  void createWithEmailPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        UserModel usermodel = UserModel(
            userId: user.user?.uid, email: user.user?.email, name: name);
        Get.to(HomeView());
      });
    } catch (e) {
      print(e);
      Get.snackbar(
        "signInError",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.grey,
      );
    }
  }

  //////////////login verfied
  bool isLogin() {
    if (gStorage.hasData('is_login')) {
      return true;
    } else {
      return false;
    }
  }

  logOut() {
    gStorage.remove('is_login');
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.offAll(Login());
    });
    update();
  }
}
