import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  /// Gender
  List<String> genderList = [
    "Male",
    "Female",
    "Other",
  ];

  /// delete

  Future<void> onRemoveUser({String? documentId}) async {
    final user = FirebaseFirestore.instance.collection("all_user");
    return user.doc(documentId).delete()
      ..then(
        (value) => Get.snackbar(
            "Success", "User has been removed successfully!",
            backgroundColor: Colors.green),
      );
  }

  /// update
  Future<void> onUpdate(
      {String? docId,
      String? firstname,
      String? lastname,
      String? age,
      String? gender}) async {
    final user = FirebaseFirestore.instance.collection("all_user");
    return user.doc(docId).update({
      "firstname": firstname,
      "lastname": lastname,
      "age": age,
      "gender": gender,
    }).then(
      (value) => Get.snackbar(
        "Success",
        "Your information has been update successfully!",
        backgroundColor: Colors.green,
          colorText: 
          Colors.white
      ),
    );
  }
}
