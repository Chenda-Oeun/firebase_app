import 'package:firebase_app/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCon = Get.put(AuthController());
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              authCon.signOutUser();
            },
            child: const Text("Log out"),
          ),
        ),
      ),
    );
  }
}
