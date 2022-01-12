import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/helper/function/local_sorage.dart';
import 'package:firebase_app/screen/authentication.dart/auth_option.dart';
import 'package:firebase_app/screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final isRegisterLoading = false.obs;
  final isSignInLoading = false.obs;
  final userId ="".obs;

  ///-----------------------------------------------------------------
  signUpUser({
    String? email,
    String? password,
    String? firstname,
    String? lastname,
  }) async {
    isRegisterLoading(true);
    try {
      final user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email!, password: password!))
          .user;

      if (user != null) {
        addUser(
          uid: user.uid.toString(),
          email: email,
          firstname: firstname,
          lastname: lastname,
        );
        await LocalStorage.storeStrings(key: "uid", value: user.uid.toString());
        userId.value =  await LocalStorage.getStrings(key: "uid");
        Get.offAll(() => const HomePage());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    isRegisterLoading(false);
  }

  ///-----------------------------------------------------------------
  addUser(
      {String? firstname,
      String? lastname,
      String? email,
      String? uid,}) async {
        CollectionReference user = FirebaseFirestore.instance.collection("all_user");
        return user.doc(uid).set({
          "firstname": firstname,
          "lastname": lastname,
          "email": email,
          "uid": uid,
        }).then((value) {
             Get.snackbar("Success", "Your account has been created successfully!",
          backgroundColor: Colors.green, colorText: Colors.white);
        }).catchError((e){
            Get.snackbar("Error", e.message.toString(),
          backgroundColor: Colors.green, colorText: Colors.white);
        });
      }

  ///-----------------------------------------------------------------

  signInUser({String? email, String? password}) async {
    isSignInLoading(true);
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((response) {
        if (response.credential.hashCode == 2011) {
          Get.offAll(() => const HomePage());
        }
      });
    } catch (message) {
      Get.snackbar(
        "Error",
        message.toString(),
      );
    }
    isSignInLoading(false);
  }

  ///----------------------------------------------------------
  onCheckUser() {
    if (FirebaseAuth.instance.currentUser?.uid == null) {
      Get.offAll(() => const OptionScreen());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  ///----------------------------------------------------------
  signOutUser() async {
    final auth = FirebaseAuth.instance;
    await auth
        .signOut()
        .then((value) => Get.offAll(() => const OptionScreen()));
  }

  ///-------------------------------------------------------
}
